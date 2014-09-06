## DSMgraph_full_4
# This shows what symptoms are related to sleep disturbance,
# eating and hunger dysfunction, fear and anxiety and sexual dysfunction.

g=DSMgraphs.full.graph
l=DSMgraphs.full.layout
adj=DSMgraphs.full.adjacency
s=DSMgraphs.full.DISxSYM

slaap<-read.table("DSMgraphs/data/sleep.txt")
angst<-read.table("DSMgraphs/data/fear.txt")
eten<-read.table("DSMgraphs/data/hunger.txt")
sex<-read.table("DSMgraphs/data/sex.txt")

for (i in 1:r) {V(g)$slaap2[i] <- slaap[i,]}
for (i in 1:r) {V(g)$angst2[i] <- angst[i,]}
for (i in 1:r) {V(g)$eten2[i] <- eten[i,]}
for (i in 1:r) {V(g)$sex2[i] <- sex[i,]}

V(g)$color <- "white"
V(g)[ slaap2 == "1" ]$color <- "yellow"  
V(g)[ angst2 == "1" ]$color <- "blue"
V(g)[ eten2 == "1" ]$color <- "green"
V(g)[ sex2 == "1" ]$color <- "red"

dev=dev.cur()
if (names(dev)!="pdf") windows(10,5)

par(mar=c(0,0,0,0))
layout(matrix(1:2,nr=1,nc=2))

plot(g,layout=l,edge.color="black",vertex.label=NA)

par(mar=c(5,2,5,2))

plot(1, ann = FALSE, axes = FALSE, xlim = c(0, 100), ylim = c(0, 100),
     type = "n", xaxs = "i", yaxs = "i")
title ("DSMgraph_full_4")
legend (50,90, c("Symptom is related to sleep disturbance",
    "Symptom is related to fear and anxiety",
    "Symptom is related to eating and hunger dysfunction",
    "Symptom is related to sexual dysfunction"), col= c("yellow","blue","green","red") ,pch = 19, xjust=0.5)

legend (50,90, c("Symptom is related to sleep disturbance",
    "Symptom is related to fear and anxiety",
    "Symptom is related to eating and hunger dysfunction",
    "Symptom is related to sexual dysfunction"), col= c("black") ,pch = 1, xjust=0.5)

