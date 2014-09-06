## DSMgraph_full_20
# shows where GAD and MDE are located
# MDE is blue, GAD is red, shared symptoms are purple

g=DSMgraphs.full.graph
l=DSMgraphs.full.layout
adj=DSMgraphs.full.adjacency
s=DSMgraphs.full.DISxSYM

r=nrow(adj)

common <- matrix (NA, nrow=r, ncol=11)
colnames(common)<-c("MDE","DYS","AGPH","SOP","SIP","GAD","PD","AD","DD","APD","Total")
common[,1]<-s[,72]
common[,2]<-s[,74]
common[,3]<-s[,81]
common[,4]<-s[,83]
common[,5]<-s[,82]
common[,6]<-s[,87]
common[,7]<-s[,79]
common[,8]<-s[,43]
common[,9]<-s[,43]
common[,10]<-s[,142]
common[which(common>0)]<-1
for (i in 1:r) {common[i,11]<-sum(common[i,1:10])}


for (i in 1:r){V(g)$common[i]<-common[i,11]}

for (i in 1:r){V(g)$MDE[i]<-common[i,1]}
for (i in 1:r){V(g)$GAD[i]<-common[i,6]}


V(g)$color <- "white"
V(g)[ MDE == "1" ]$color <- "blue"  
V(g)[ GAD == "1" ]$color <- "red"
V(g)[ MDE == "1" & GAD == "1"]$color <- "purple"

dev=dev.cur()
if (names(dev)!="pdf") windows(10,5)

par(mar=c(0,0,0,0))
layout(matrix(1:2,nr=1,nc=2))

plot(g,layout=l,edge.color="black",vertex.label=NA)

par(mar=c(5,2,5,2))

plot(1, ann = FALSE, axes = FALSE, xlim = c(0, 100), ylim = c(0, 100),
     type = "n", xaxs = "i", yaxs = "i")
title ("DSMgraph_full_20")
text (0,95,"Major Depressive Episode and Generalized Anxiety Disorder", pos=4)

legend (50,90, c("Symptom is not a symptom of MDE or GAD",
    "Symptom is a symptom of MDE",
    "Symptom is a symptom of GAD",
    "Symptom is a shared symptom of MDE and GAD"), col= c("white","blue","red","purple") ,pch = 19, xjust=0.5)
legend (50,90, c("Symptom is not a symptom of MDE or GAD",
    "Symptom is a symptom of MDE",
    "Symptom is a symptom of GAD",
    "Symptom is a shared symptom of MDE and GAD"), col= c("black") ,pch = 1, xjust=0.5)

