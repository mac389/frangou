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


commonMDEnGAD <- common[(adjsumMDEnGAD > 0),c(1,6)]

for (i in 1:rMDEnGAD){V(gMDEnGAD)$MDE[i]<-commonMDEnGAD[i,1]}
for (i in 1:rMDEnGAD){V(gMDEnGAD)$GAD[i]<-commonMDEnGAD[i,2]}

adjsumMDE2 <- adjsumMDE[(adjsumMDEnGAD > 0)]
adjsumGAD2 <- adjsumGAD[(adjsumMDEnGAD > 0)]

for (i in 1:rMDEnGAD){V(gMDEnGAD)$MDEcon[i]<-adjsumMDE2[i]}
for (i in 1:rMDEnGAD){V(gMDEnGAD)$GADcon[i]<-adjsumGAD2[i]}

lMDEnGAD2=l[(adjsumMDEnGAD > 0),]


DSMgraphs.MDEGAD1.graph=gMDEnGAD
DSMgraphs.MDEGAD1.layout=lMDEnGAD2
DSMgraphs.MDEGAD1.adjacency=adjMDEnGAD

layout(1)

plot(DSMgraphs.MDEGAD1.graph,layout=DSMgraphs.MDEGAD1.layout, vertex.color="white",
	edge.color="black",vertex.label=NA)
title ("MDE and GAD + directly conected")

print("---------")
print("MDE and GAD + directly conected graph loaded")
print("Graph object saved in: DSMgraphs.MDEGAD1.graph")
print("Layout object saved in: DSMgraphs.MDEGAD1.layout")
print("Adjacency matrix saved in DSMgraphs.MDEGAD1.adjacency")
print("---------")