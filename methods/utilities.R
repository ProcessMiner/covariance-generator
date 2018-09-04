VectorToColumn <- function(vec) {
  return(matrix(vec, ncol = 1))
}


PlotMatrix <- function(mat) {
  
  longData<-melt(mat)
  longData<-longData[longData$value!=0,]
  
  p <- ggplot(longData, aes(x = Var2, y = Var1)) + 
        geom_raster(aes(fill=value)) + 
        scale_fill_gradient(low="grey90", high="red") +
        labs(x="", y="", title="Matrix") +
        theme_bw() + theme(axis.text.x=element_text(size=9, angle=0, vjust=0.3),
                           axis.text.y=element_text(size=9),
                           plot.title=element_text(size=11))
  return(p)
}
