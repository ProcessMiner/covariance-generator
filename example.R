rm(list = ls())
source("methods/libraries.R")
source("methods/datasimulation.R")
source("methods/utilities.R")

## Generating covariance
covarianceMatrix <- SimulateCov(p = 5, 
                                corrRange = list(min = -0.7, max = 0.9), 
                                sdRange = list(min = 0.5, max = 0.75))
print(PlotMatrix(covarianceMatrix))

## Generating Block Covariance
blockCovariance <- SimulateBlockCovariance(totalVars = 10, 
                                           maxVarsInABlock = 3, 
                                           corrRange = list(min = -0.7, max = 0.9), 
                                           sdRange = list(min = 0.5, max = 0.75))
print(PlotMatrix(blockCovariance))
