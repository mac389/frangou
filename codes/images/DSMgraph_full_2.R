## DSMgraph_full_2
# This views the number of disorders that feature ach symptom.

g=DSMgraphs.full.graph
l=DSMgraphs.full.layout
adj=DSMgraphs.full.adjacency
s=DSMgraphs.full.DISxSYM

dis1<- rowSums(s)

for (i in 1:r){V(g)$dis[i]<-dis1[i]}

V(g)[ dis == "1" ]$color <- "white"
V(g)[ dis == "2" ]$color <- "grey"
V(g)[ dis == "3" ]$color <- "grey"
V(g)[ dis == "4" ]$color <- "grey"
V(g)[ dis == "5" ]$color <- "grey"
V(g)[ dis == "6" ]$color <- "yellow"
V(g)[ dis == "7" ]$color <- "yellow"
V(g)[ dis == "8" ]$color <- "yellow"
V(g)[ dis == "9" ]$color <- "yellow"
V(g)[ dis == "10" ]$color <- "yellow"
V(g)[ dis == "11" ]$color <- "orange"
V(g)[ dis == "12" ]$color <- "orange"
V(g)[ dis == "13" ]$color <- "orange"
V(g)[ dis == "14" ]$color <- "orange"
V(g)[ dis == "15" ]$color <- "orange"
V(g)[ dis == "16" ]$color <- "red"
V(g)[ dis == "17" ]$color <- "red"
V(g)[ dis == "18" ]$color <- "red"
V(g)[ dis == "19" ]$color <- "red"
V(g)[ dis == "20" ]$color <- "red"
V(g)[ dis == "21" ]$color <- "purple"
V(g)[ dis > 21 ]$color <- "purple"

dev=dev.cur()
if (names(dev)!="pdf") windows(10,5)

par(mar=c(0,0,0,0))
layout(matrix(1:2,nr=1,nc=2))

plot(g,layout=l,edge.color="black",vertex.label=NA)

par(mar=c(5,2,5,2))

plot(1, ann = FALSE, axes = FALSE, xlim = c(0, 100), ylim = c(0, 100),
     type = "n", xaxs = "i", yaxs = "i")
title ("DSMgraph_full_2")
text (0,95,"Number of disorders that feature the symptom", pos=4)
legend (50,90, c("1", "2 to 5", "6 to 10", "11 to 15", "16 to 20", "21+"), col= c("white","grey","yellow","orange","red","purple") ,pch = 19, xjust=0.5, cex=1.5)
legend (50,90, c("1", "2 to 5", "6 to 10", "11 to 15", "16 to 20", "21+"), col= c("black") ,pch = 1, xjust=0.5, cex=1.5)

