# Generate Covariance and Block Covariance Matrix in R

Authors: [Somrita Sarkar](https://www.linkedin.com/in/somrita-sarkar/), [Chitta Ranjan](https://www.linkedin.com/in/chitta-ranjan-b0851911/).

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
![covariance matrix](https://github.com/ProcessMiner/covariance-generator/blob/master/plots/covariance.jpeg?raw=true "Covariance Matrix")

The inputs to the function are,

`p`  the number variables (rows/columns in the covariance matrix).

`corrRange`  the range for the correlations between the `p` variables. The range can be between [-1.0, 1.0].

`sdRange`  the range for the standard deviations of the `p` variables. Its range can be (0, infinity).

The function `SimulateCov` works by first randomly generating a correlation matrix and then converts it into a positive definite matrix, which is used at the covariance. The argument `sdRange` is required for this conversion to yield a unique solution. Without defining the `sdRange`, there can be several solutions to the correlation-to-covariance conversion. The `sdRange` becomes the upper and lower limit for the diagonal elements in `covarianceMatrix`.

## Block Covariance

We can generate block covariance using `SimulateBlockCovariance(totalVars, maxVarsInABlock, corrRange, sdRange)`.

```
> blockCovariance <- SimulateBlockCovariance(totalVars = 10, 
                                            maxVarsInABlock = 3, 
                                            corrRange = list(min = -0.5, max = 0.9), 
                                            sdRange = list(min = 0.5, max = 0.75))

> blockCovariance
           [,1]        [,2]        [,3]      [,4]      [,5]      [,6]       [,7]       [,8]        [,9]       [,10]
 [1,] 0.5253886  0.09911930  0.12001999 0.0000000 0.0000000 0.0000000  0.0000000  0.0000000  0.00000000  0.00000000
 [2,] 0.0991193  0.55887218 -0.06217979 0.0000000 0.0000000 0.0000000  0.0000000  0.0000000  0.00000000  0.00000000
 [3,] 0.1200200 -0.06217979  0.30964417 0.0000000 0.0000000 0.0000000  0.0000000  0.0000000  0.00000000  0.00000000
 [4,] 0.0000000  0.00000000  0.00000000 0.2866114 0.1846021 0.1510859  0.0000000  0.0000000  0.00000000  0.00000000
 [5,] 0.0000000  0.00000000  0.00000000 0.1846021 0.4078875 0.3638950  0.0000000  0.0000000  0.00000000  0.00000000
 [6,] 0.0000000  0.00000000  0.00000000 0.1510859 0.3638950 0.5286350  0.0000000  0.0000000  0.00000000  0.00000000
 [7,] 0.0000000  0.00000000  0.00000000 0.0000000 0.0000000 0.0000000  0.3764742 -0.1397405  0.00000000  0.00000000
 [8,] 0.0000000  0.00000000  0.00000000 0.0000000 0.0000000 0.0000000 -0.1397405  0.2542494  0.00000000  0.00000000
 [9,] 0.0000000  0.00000000  0.00000000 0.0000000 0.0000000 0.0000000  0.0000000  0.0000000  0.29512556 -0.08383803
[10,] 0.0000000  0.00000000  0.00000000 0.0000000 0.0000000 0.0000000  0.0000000  0.0000000 -0.08383803  0.43995215

> print(PlotMatrix(blockCovariance))
```

![covariance matrix](https://github.com/ProcessMiner/covariance-generator/blob/master/plots/blockcovariance.jpeg?raw=true "Block Covariance")

The new inputs in this function are,

`totalVars`  Total number of variables (rows/columns) in the generated block covariance matrix.

`maxVarsInABlock`  The maximum number of variables allowed in one block.

As can be seen in the above sample output, the blocks sizes are no more than 3 (ranging from 1 to 3). Also, the standard deviations (on the diagonal) are between 0.5 and 0.75.

## Support

The code is supported by the Science team at ProcessMiner, Inc. If you have any questions/comments, please leave them here in the comments section or email at support@processminer.com.