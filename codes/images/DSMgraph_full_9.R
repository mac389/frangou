## DSMgraph_full_9
# This script creates a graph that shows the symptoms of common disorders.
# The common disorders are: "MDE indicates major depressive episode;
# DYS, dysthymia; AGPH, agoraphobia; SOP, social phobia; SIP, simple phobia; GAD, generalized anxiety disorder; PD, panic disorder; AD, alcohol dependence;
# DD, drug dependence; and APD, antisocial personality disorder.")

# Key to DSMGraphCommon1.pdf: This shows in how much of the common disorders the symptom is located.
# White=0, Yellow=1, Orange=2 and Red=3.


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

V(g)$color<-"white"
V(g)[ common == "0" ]$color <- "white"
V(g)[ common == "1" ]$color <- "yellow"
V(g)[ common == "2" ]$color <- "orange"
V(g)[ common == "3" ]$color <- "red"
V(g)[ common > 3 ]$color <- "purple"

dev=dev.cur()
if (names(dev)!="pdf") windows(10,5)

par(mar=c(0,0,0,0))
layout(matrix(1:2,nr=1,nc=2))

plot(g,layout=l,edge.color="black",vertex.label=NA)

par(mar=c(5,2,5,2))

plot(1, ann = FALSE, axes = FALSE, xlim = c(0, 100), ylim = c(0, 100),
     type = "n", xaxs = "i", yaxs = "i")
title ("DSMgraph_full_9")
text (0,95,"Number of common disorders that feature the symptom", pos=4)
legend (50,90, c("Symptom is not featured in any of the common disorders", "1", "2", "3", "4+"), col= c("white","yellow","orange","red","purple") ,pch = 19, xjust=0.5)
legend (50,90, c("Symptom is not featured in any of the common disorders", "1", "2", "3", "4+"), col= c("black") ,pch = 1, xjust=0.5)

