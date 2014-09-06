library("igraph")

## Creates graph object, layout and adjacency matrix for the entire graph.

s<-as.matrix(read.table("DSMgraphs/data/disordermatrix.txt"))
r<-nrow(s)
adj<-matrix(data = NA, nrow = r, ncol = r)
adj=(s%*%t(s)>0)-diag(diag(s%*%t(s)>0))

g=graph.adjacency(adj, mode="undirected")
V(g)$label <- seq(vcount(g))

deg=degree(g)
edge.central=edge.betweenness(g)

for (i in 1:vcount(g)) {V(g)$size[i]=2.5+5*(deg[i]/100)}
for (i in 1:ecount(g)) {E(g)$width[i]=0.3+sqrt((edge.central[i]/700))}

set.seed(12)
l=layout.fruchterman.reingold(g,niter=500,area=vcount(g)^2.3,repulserad=vcount(g)^2.8)

colSums (adj[(s[,72]== "1"),])->adjsumMDE
colSums (adj[(s[,87]== "1"),])->adjsumGAD

colSums (adj[(rowSums(s[,c(72,87)]) > 0) ,])->adjsumMDEnGAD
adj[(adjsumMDEnGAD > 0),(adjsumMDEnGAD > 0) ] -> adjMDEnGAD
gMDEnGAD=graph.adjacency(adjMDEnGAD, mode="undirected")
V(gMDEnGAD)$label <- V(g)[(adjsumMDEnGAD > 0)]$label
rMDEnGAD<-nrow(adjMDEnGAD)

deg=degree(g)
deg2 <- deg[(adjsumMDEnGAD > 0)]

# edge.centralMDEnGAD=edge.betweenness(gMDEnGAD)

for (i in 1:vcount(gMDEnGAD)) {V(gMDEnGAD)$size[i]=3.5+5*(deg2[i]/75)}
# for (i in 1:ecount(gMDEnGAD)) {E(gMDEnGAD)$width[i]=0.3+sqrt((edge.centralMDEnGAD[i]/700))}


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

commonMDEnGADrowsums<-rowSums (common[,c(1,6)])
adj[(commonMDEnGADrowsums> 0),(commonMDEnGADrowsums> 0) ] -> adjMDEnGAD2
gMDEnGAD2=graph.adjacency(adjMDEnGAD2, mode="undirected")
V(gMDEnGAD2)$label <- V(g)[(commonMDEnGADrowsums > 0)]$label
rMDEnGAD2<-nrow(adjMDEnGAD2)

deg3 <- deg[(commonMDEnGADrowsums> 0)]
for (i in 1:vcount(gMDEnGAD2)) {V(gMDEnGAD2)$size[i]=10+5*(deg3[i]/75)}

set.seed(1)
lMDEnGAD2=layout.fruchterman.reingold(gMDEnGAD2,niter=500)

commonMDEnGAD2 <- common[(commonMDEnGADrowsums > 0),c(1,6)]

for (i in 1:rMDEnGAD2){V(gMDEnGAD2)$MDE[i]<-commonMDEnGAD2[i,1]}
for (i in 1:rMDEnGAD2){V(gMDEnGAD2)$GAD[i]<-commonMDEnGAD2[i,2]}

DSMgraphs.MDEGAD2.graph=gMDEnGAD2
DSMgraphs.MDEGAD2.layout=lMDEnGAD2
DSMgraphs.MDEGAD2.adjacency=adjMDEnGAD2

layout(1)

plot(DSMgraphs.MDEGAD2.graph,layout=DSMgraphs.MDEGAD2.layout, vertex.color="white",
	edge.color="black",vertex.label=NA)
title ("MDE and GAD")

print("---------")
print("MDE and GAD graph loaded")
print("Graph object saved in: DSMgraphs.MDEGAD2.graph")
print("Layout object saved in: DSMgraphs.MDEGAD2.layout")
print("Adjacency matrix saved in DSMgraphs.MDEGAD2.adjacency")
print("---------")