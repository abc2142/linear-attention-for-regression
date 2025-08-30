%   Reference:
%           https://kempnerinstitute.harvard.edu/research/deeper-learning/solvable-model-of-in-context-learning-using-linear-attention/
%           https://arxiv.org/abs/2405.11751
%
%   D = dimension of w
%   M = task diversity
%   K = context length + 1 (last one is a query)
%   sigma_sq =  noise variance or 1/SNR
%   pretrain_flag:
%                 = 1 if w ~ T_pretrain
%                 = 0 if w ~ T_true = N(0, I)
%
%   Gamma = parameters of a single linear attention layer
%

function [vGamma, Gamma] = pretrain_Gamma(D, M, K, sigma_sq, W_pretrain, pretrain_flag)

% M tasks
% W_pretrain = randn(D, M); % each column contains a task vector w

A=0;
B=0;

num_iterations = 1e6;
for n=1:num_iterations

  if pretrain_flag
    w = W_pretrain(:, mod(n, M)+1);
  else
    w = randn(D,1);
  end

  X = randn(K,D)/sqrt(D);
  epsilon = sqrt(sigma_sq)*randn(K,1);
  y = X*w + epsilon;

  X_context = X(1:K-1, :); % K-1, D
  y_context = y(1:K-1, :); % K-1

  x_query = X(K, :);
  Hz = x_query'/(K-1)*[D*y_context'*X_context, sum(y_context.^2)]; % D, D+1

  vHz = Hz';
  vHz = vHz(:); % stack the rows of Hz

  A = A + vHz*vHz';
  B = B + y(K)*vHz;

end

lamda=0; % no ridge
vGamma = pinv(num_iterations/D*lamda*eye(length(vHz)) + A )*B;
Gamma = reshape(vGamma, D+1, D)';


end

