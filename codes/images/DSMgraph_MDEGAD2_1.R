## DSMgraph_MDEGAD2_1
# MDE, GAD

gMDEnGAD=DSMgraphs.MDEGAD2.graph
lMDEnGAD2=DSMgraphs.MDEGAD2.layout
adjMDEnGAD=DSMgraphs.MDEGAD2.adjacency


V(gMDEnGAD2)[ MDE == "1" ]$color <- "blue"  
V(gMDEnGAD2)[ GAD == "1" ]$color <- "red"
V(gMDEnGAD2)[ MDE == "1" & GAD == "1"]$color <- "purple"

dev=dev.cur()
if (names(dev)!="pdf") windows(10,5)

par(mar=c(0,0,0,0))
layout(matrix(1:2,nr=1,nc=2))

plot(gMDEnGAD2,layout=lMDEnGAD2,edge.color="black",vertex.label=NA)

par(mar=c(5,2,5,2))

plot(1, ann = FALSE, axes = FALSE, xlim = c(0, 100), ylim = c(0, 100),
     type = "n", xaxs = "i", yaxs = "i")
title ("DSMgraph_MDEGAD2_1")
legend (50,90, c("MDE", "GAD", "MDE and GAD"), col= c("blue", "red", "purple") ,pch = 19, xjust=0.5, cex=1.5)
legend (50,90, c("MDE", "GAD", "MDE and GAD"), col= c("black") ,pch = 1, xjust=0.5, cex=1.5)

