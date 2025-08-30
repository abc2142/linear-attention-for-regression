clear all;

D = 8; % task dimension
sigma_sq = 0.01; % noise variance

for Kexp=4:4
  for Mexp=2:9
    close all;

    K=2^Kexp; % context length + 1 query
    M=2^Mexp; % task diversity
    W_pretrain = randn(D, M); % each column contains a task vector w

    % Pretraining Gamma
    [vGamma, Gamma] = pretrain_Gamma(D, M, K, sigma_sq, W_pretrain, 1);


    figure;
    imagesc(abs(Gamma));
    % https://octave.sourceforge.io/octave/function/imagesc.html
    % https://www.mathworks.com/help/matlab/ref/imagesc.html

    xlabel('column index, j');
    ylabel('row index, i');
    colorbar;

    title(['|\Gamma|, max |\Gamma_{i,j}|=', num2str(max(abs(Gamma(:)))), ', for D=', num2str(D), ', K=', num2str(K), ', M=', num2str(M), ', \sigma^2=', num2str(sigma_sq)]);
    print('-djpg', ['thermal_Gamma_D', num2str(D),'_K',num2str(K),'_M',num2str(M),'.jpg']);

  end
end


