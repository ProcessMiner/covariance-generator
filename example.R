rm(list = ls())
source("methods/libraries.R")
source("methods/datasimulation.R")
source("methods/utilities.R")

## Generating covariance
covarianceMatrix <- SimulateCov(p = 5, 
                                corrRange = list(min = -0.7, max = 0.9), 
                                sdRange = list(min = 0.5, max = 0.75))
covarianceMatrix
print(PlotMatrix(covarianceMatrix))

## Generating Block Covariance
blockCovariance <- SimulateBlockCovariance(totalVars = 10, 
                                           maxVarsInABlock = 3, 
                                           corrRange = list(min = -0.7, max = 0.9), 
                                           sdRange = list(min = 0.5, max = 0.75))
blockCovariance
print(PlotMatrix(blockCovariance))

sparseCovariance <- SimulateCov(p = 10, 
                                corrRange = list(min = -0.7, max = 0.9), 
                                sdRange = list(min = 0.5, max = 0.75),
                                sparsity = 0.1)
sparseCovariance
print(PlotMatrix(sparseCovariance))
