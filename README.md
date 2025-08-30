## Reference:

 https://arxiv.org/abs/2405.11751


## Implementation of a parameter matrix $\Gamma$ 

* $H_Z$ is a $D \times (D+1)$ matrix defined by ( Eq (11) of the paper )

* $\Gamma$ is a $D \times (D+1)$ matrix of the transformer parameters to be optmized.

* The prediction of $y$ can be approximated as $\hat{y} = < \Gamma, H_Z> = \mbox{Trace}( H_z^T \Gamma )$