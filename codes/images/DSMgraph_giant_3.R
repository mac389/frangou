## DSMgraph_giant_3
# This graph will show the 20 highest connected symptoms of the giant in red and
# the 20 lowest connected symptoms of the giant in blue

g2=DSMgraphs.giant.graph
l2=DSMgraphs.giant.layout
adj2=DSMgraphs.giant.adjacency
s2=sg=DSMgraphs.giant.DISxSYM

connections<-rowSums(adj2)
for (i in 1:r2){V(g2)$connections[i]<-connections[i]}

V(g2)$rankingiant <- rank(V(g2)$connections)

V(g2)$color<-"white"
V(g2)[ rankingiant > (r2-20) ]$color <- "red"
V(g2)[ rankingiant < 21 ]$color <- "blue"

dev=dev.cur()
if (names(dev)!="pdf") windows(10,5)

par(mar=c(0,0,0,0))
layout(matrix(1:2,nr=1,nc=2))

plot(g2,layout=l2,edge.color="black",vertex.label=NA)

par(mar=c(5,2,5,2))

plot(1, ann = FALSE, axes = FALSE, xlim = c(0, 100), ylim = c(0, 100),
     type = "n", xaxs = "i", yaxs = "i")
title ("DSMgraph_giant_3")
legend (50,90, c("Symptom is not part of the giant component", "20 highest connected symptoms in the giant component", "20 lowest connected symptoms in the giant component"), col= c("black","red","blue") ,pch = 19, xjust=0.5)
legend (50,90, c("Symptom is not part of the giant component", "20 highest connected symptoms in the giant component", "20 lowest connected symptoms in the giant component"), col= c("black") ,pch = 1, xjust=0.5)

