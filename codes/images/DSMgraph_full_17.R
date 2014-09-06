## DSMgraph_full_17
# AD


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


for (i in 1:r){V(g)$AD[i]<-common[i,8]}

V(g)$color<-"white"
V(g)[ AD == "1" ]$color <- "green"

dev=dev.cur()
if (names(dev)!="pdf") windows(10,5)

par(mar=c(0,0,0,0))
layout(matrix(1:2,nr=1,nc=2))

plot(g,layout=l,edge.color="black",vertex.label=NA)

par(mar=c(5,2,5,2))

plot(1, ann = FALSE, axes = FALSE, xlim = c(0, 100), ylim = c(0, 100),
     type = "n", xaxs = "i", yaxs = "i")
title ("DSMgraph_full_17")
legend (50,90, c("Symptom is not a symptom of Alcohol Dependence",
    "Symptom is a symptom of Alcohol Dependence"), col= c("white","green") ,pch = 19, xjust=0.5)
legend (50,90, c("Symptom is not a symptom of Alcohol Dependence",
    "Symptom is a symptom of Alcohol Dependence"), col= c("black") ,pch = 1, xjust=0.5)


