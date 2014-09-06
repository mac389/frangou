library("igraph")

## Creates graph object, layout and adjacency matrix for the giant component.

s<-as.matrix(read.table("DSMgraphs/data/disordermatrix.txt"))
r<-nrow(s)
adj<-matrix(data = NA, nrow = r, ncol = r)
adj=(s%*%t(s)>0)-diag(diag(s%*%t(s)>0))

g=graph.adjacency(adj, mode="undirected")

set.seed(12)
l=layout.fruchterman.reingold(g,niter=500,area=vcount(g)^2.3,repulserad=vcount(g)^2.8)

gmmax<-max(clusters(g)$membership)
gm<-matrix(NA, nrow=gmmax, ncol=1)
for (i in 1:gmmax){ gm[i] <- (sum(clusters(g)$membership[clusters(g)$membership == i])/i)}
which.max(gm)-> giant

for (i in 1:r){ if (clusters(g)$membership[i] == giant ) {V(g)$giant[i] <- 1} else {V(g)$giant[i] <- 0}}

nodesgiant=as.logical(V(g)$giant)

adj2=adj[nodesgiant,nodesgiant]
s2=s[nodesgiant,]
g2=graph.adjacency(adj2, mode="undirected")
r2<-nrow(adj2)
deg=degree(g2)
edge.central=edge.betweenness(g2)
for (i in 1:vcount(g2)) {V(g2)$size[i]=2.5+5*(deg[i]/100)}
for (i in 1:ecount(g2)) {E(g2)$width[i]=0.3+sqrt((edge.central[i]/700))}
l2=l[nodesgiant,]

DSMgraphs.giant.graph=g2
DSMgraphs.giant.layout=l2
DSMgraphs.giant.adjacency=adj2
DSMgraphs.giant.DISxSYM=s2

layout(1)

plot(DSMgraphs.giant.graph,layout=DSMgraphs.giant.layout, vertex.color="white",
	edge.color="black",vertex.label=NA)
title ("The Giant Component")

print("---------")
print("Giant component graph loaded")
print("Graph object saved in: DSMgraphs.giant.graph")
print("Layout object saved in: DSMgraphs.giant.layout")
print("Adjacency matrix saved in DSMgraphs.giant.adjacency")
print("Matrix with disorders and symptoms saved in DSMgraphs.giant.DISxSYM")
print("---------")
