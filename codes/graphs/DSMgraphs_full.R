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

DSMgraphs.full.graph=g
DSMgraphs.full.layout=l
DSMgraphs.full.adjacency=adj
DSMgraphs.full.DISxSYM=s

layout(1)

plot(DSMgraphs.full.graph,layout=DSMgraphs.full.layout, vertex.color="white",
	edge.color="black",vertex.label=NA)
title ("Full graph")

print("---------")
print("Full graph loaded")
print("Graph object saved in: DSMgraphs.full.graph")
print("Layout object saved in: DSMgraphs.full.layout")
print("Adjacency matrix saved in DSMgraphs.full.adjacency")
print("Matrix with disorders and symptoms saved in DSMgraphs.full.DISxSYM")
print("---------")
