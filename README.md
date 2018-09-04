# Generate Covariance and Block Covariance Matrix in R

This repository provides implemented codes in R for generation of a covariance and block covariance matrices.

A randomly generated covariance matrix is usually used for simulating random correlated data. The correlation structures are desired to have different characteristics for different problems. The provided functions help generate covariances for most of the problems.

## Covariance Matrix

Using `SimulateCov(p, corrRange, sdRange)` we generate a positive definite covariance matrix.

```
> covarianceMatrix <- SimulateCov(p = 5, 
                                 corrRange = list(min = -0.7, max = 0.9), 
                                 sdRange = list(min = 0.5, max = 0.75))

> covarianceMatrix
            [,1]         [,2]        [,3]         [,4]        [,5]
[1,]  0.42173609  0.231879364  0.05170357 -0.188813524  0.07804691
[2,]  0.23187936  0.418240784 -0.06683895  0.001306713 -0.05796761
[3,]  0.05170357 -0.066838954  0.28883131 -0.096017196 -0.18772132
[4,] -0.18881352  0.001306713 -0.09601720  0.430207248  0.03353824
[5,]  0.07804691 -0.057967609 -0.18772132  0.033538245  0.27670991

> print(PlotMatrix(covarianceMatrix))
```
![covariance matrix](https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "Logo Title Text 1")

