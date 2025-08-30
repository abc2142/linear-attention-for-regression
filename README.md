## Reference:

 https://arxiv.org/abs/2405.11751


## Implementation of a parameter matrix $\Gamma$ 

* $H_Z$ is a $D \times (D+1)$ matrix defined by ( Eq (11) of the paper )

$$ H_Z = {\bf x}_{K} \left[\frac{D}{K-1} \sum_{i \le K-1} y_i {\bf x}_i^T, \ \frac{1}{K-1} \sum_{i \le K-1} y_i^2 \right]$$


* $\Gamma$ is a $D \times (D+1)$ matrix of the transformer parameters to be optmized.


* The prediction of $y$ can be approximated as

$$\hat{y} = < \Gamma, H_Z> = \mbox{Trace}( H_z^T \Gamma )$$