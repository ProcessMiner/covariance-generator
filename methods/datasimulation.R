SimulateRawCorrelation <- function(p, corrRange, sparsity = NULL) {
  # Input
  # p          Number of variables
  # corrRange  list(min, max), the minimum and maximum amount of correlation between -1 and 1.
  R <- matrix(runif(n = p * p, min = corrRange$min, max = corrRange$max), ncol = p)       
  R <- R * lower.tri(R) + t(R * lower.tri(R))
  
  if(!is.null(sparsity)) {
    
    if(sparsity < -0.0 || sparsity > 1.0) {
      stop("Sparsity should be between 0 and 1.")
    }
    
    for(i in 1:(nrow(R) - 1)) {
      for(j in (i + 1):ncol(R)) {
        if(runif(1) > sparsity) {
          R[i, j] <- 0
          R[j, i] <- 0
        }
      }
    }
  }
  
  diag(R) <- 1
  return(R)  
}

NearestPosDef <- function(x, corr = T) {
  # Input
  # x	    numeric n * n approximately positive definite symmetric matrix, typically an approximation to a correlation            or covariance matrix.
  # corr  logical indicating if the matrix should be a correlation matrix.
  return(as.matrix(nearPD(x = x, corr = corr)$mat))
}

Cor2Cov <- function(cor.mat, sdRange) {
  # Input
  # cor.mat  correlation matrix
  # sdRange  The range for the standard deviation for each variable (diagonal of covariance mat)
  return(cor2cov(cor.mat, runif(n = ncol(cor.mat), 
                                min = sdRange$min, 
                                max = sdRange$max)))
}

SimulateCov <- function(p, corrRange, sdRange, sparsity = NULL) {
  if(corrRange$min < -1.0 || corrRange$max > 1.0) {
    stop("Improper correlation range.")
  }
  
  if(sdRange$min < 0.0) {
    stop("Improper standard deviation range.")
  }
  
  if(p == 1) {
    return((runif(n = 1, min = sdRange$min, max = sdRange$max)) ^ 2)
  } else {
    rawCorr <- SimulateRawCorrelation(p = p, 
                                      corrRange = list(min = corrRange$min, 
                                                       max = corrRange$max),
                                      sparsity = sparsity
    )
    corr <- NearestPosDef(x = rawCorr, corr = T)
    
    return(Cor2Cov(cor.mat = corr, sdRange = sdRange))  
  }
}

SimulateBlockCovariance <- function(totalVars, maxVarsInABlock, corrRange, sdRange) {

  numVars <- 1
  seedCovariance <- matrix(0, ncol = totalVars, nrow = totalVars)

  while(numVars <= totalVars) {
    
    p <- sample.int(n = maxVarsInABlock, size = 1)
    if((numVars + p) > totalVars) {
      seedCovariance[numVars:totalVars, numVars:totalVars] <- 
        SimulateCov(p = (totalVars - numVars + 1), 
                    corrRange = list(min = corrRange$min, max = corrRange$max), 
                    sdRange = list(min = sdRange$min, max = sdRange$max))
    } else {
      seedCovariance[numVars:(numVars + p - 1), numVars:(numVars + p - 1)] <- 
        SimulateCov(p = p, 
                    corrRange = list(min = corrRange$min, max = corrRange$max), 
                    sdRange = list(min = sdRange$min, max = sdRange$max))
    }
    numVars <- numVars + p
  }
  return(seedCovariance)  
}
