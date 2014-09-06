## DSMgraph_full_21
# This shows the giant component

g=DSMgraphs.full.graph
l=DSMgraphs.full.layout
adj=DSMgraphs.full.adjacency
s=DSMgraphs.full.DISxSYM


gmmax<-max(clusters(g)$membership)
gm<-matrix(NA, nrow=gmmax, ncol=1)
for (i in 1:gmmax){ gm[i] <- (sum(clusters(g)$membership[clusters(g)$membership == i])/i)}
which.max(gm)-> giant

for (i in 1:r){ if (clusters(g)$membership[i] == giant ) {V(g)$giant[i] <- 1} else {V(g)$giant[i] <- 0}}

V(g)$color<-"white"
V(g)[ giant == "1" ]$color <- "red"

dev=dev.cur()
if (names(dev)!="pdf") windows(10,5)

par(mar=c(0,0,0,0))
layout(matrix(1:2,nr=1,nc=2))

plot(g,layout=l,edge.color="black",vertex.label=NA)

par(mar=c(5,2,5,2))

plot(1, ann = FALSE, axes = FALSE, xlim = c(0, 100), ylim = c(0, 100),
     type = "n", xaxs = "i", yaxs = "i")
title ("DSMgraph_full_21")
legend (50,90, c("Symptom is not part of the giant component", "Symptom is part of the giant component"), col= c("white","red") ,pch = 19, xjust=0.5)
legend (50,90, c("Symptom is not part of the giant component", "Symptom is part of the giant component"), col= c("black") ,pch = 1, xjust=0.5)

