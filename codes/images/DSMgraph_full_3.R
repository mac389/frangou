## DSMgraph_full_3
# This shows how widely spread symptoms are over different chapters of the DSM

g=DSMgraphs.full.graph
l=DSMgraphs.full.layout
adj=DSMgraphs.full.adjacency
s=DSMgraphs.full.DISxSYM

chap3<- matrix (data=NA, nrow = r, ncol = 16)

for (j in 1:16) { for (i in 1:r) {
    if (chap1[i,j] > 0) {chap3[i,j]<-1} else {chap3[i,j]<-0} }}

chap33<-rowSums(chap3)

for (i in 1:r){V(g)$spreadc[i]<-chap33[i]}

V(g)$color<-"white"
V(g)[ spreadc == "1" ]$color <- "white"
V(g)[ spreadc == "2" ]$color <- "blue"
V(g)[ spreadc == "3" ]$color <- "green"
V(g)[ spreadc == "4" ]$color <- "yellow"
V(g)[ spreadc == "5" ]$color <- "orange"
V(g)[ spreadc == "6" ]$color <- "red"
V(g)[ spreadc > 6 ]$color <- "purple"

dev=dev.cur()
if (names(dev)!="pdf") windows(10,5)

par(mar=c(0,0,0,0))
layout(matrix(1:2,nr=1,nc=2))

plot(g,layout=l,edge.color="black",vertex.label=NA)

par(mar=c(5,2,5,2))

plot(1, ann = FALSE, axes = FALSE, xlim = c(0, 100), ylim = c(0, 100),
     type = "n", xaxs = "i", yaxs = "i")
title ("DSMgraph_full_3")
text (0,95,"Number of chapters that feature the symptom", pos=4)
legend (50,90, c("1", "2", "3", "4", "5", "6", "7+"), col= c("white","blue","green","yellow","orange","red","purple") ,pch = 19, xjust=0.5, cex=1.5)
legend (50,90, c("1", "2", "3", "4", "5", "6", "7+"), col= c("black") ,pch = 1, xjust=0.5, cex=1.5)