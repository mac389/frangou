## DSMgraph_full_6
# This graph shows every symptom that is related
# to fear and anxiety.

g=DSMgraphs.full.graph
l=DSMgraphs.full.layout
adj=DSMgraphs.full.adjacency
s=DSMgraphs.full.DISxSYM

angst<-read.table("DSMgraphs/data/fear.txt")
dis1<- rowSums(s)

for (i in 1:r){V(g)$angst[i]<-(angst[i,]*dis1[i])}

V(g)$color<-"white"
V(g)[ angst == "1" ]$color <- "blue"
V(g)[ angst == "2" ]$color <- "green"
V(g)[ angst == "3" ]$color <- "green"
V(g)[ angst == "4" ]$color <- "green"
V(g)[ angst == "5" ]$color <- "green"
V(g)[ angst == "6" ]$color <- "yellow"
V(g)[ angst == "7" ]$color <- "yellow"
V(g)[ angst == "8" ]$color <- "yellow"
V(g)[ angst == "9" ]$color <- "yellow"
V(g)[ angst == "10" ]$color <- "yellow"
V(g)[ angst == "11" ]$color <- "orange"
V(g)[ angst == "12" ]$color <- "orange"
V(g)[ angst == "13" ]$color <- "orange"
V(g)[ angst == "14" ]$color <- "orange"
V(g)[ angst == "15" ]$color <- "orange"
V(g)[ angst == "16" ]$color <- "red"
V(g)[ angst == "17" ]$color <- "red"
V(g)[ angst == "18" ]$color <- "red"
V(g)[ angst == "19" ]$color <- "red"
V(g)[ angst == "20" ]$color <- "red"
V(g)[ angst == "21" ]$color <- "purple"
V(g)[ angst > 21 ]$color <- "purple"

dev=dev.cur()
if (names(dev)!="pdf") windows(10,5)

par(mar=c(0,0,0,0))
layout(matrix(1:2,nr=1,nc=2))

plot(g,layout=l,edge.color="black",vertex.label=NA)


par(mar=c(5,2,5,2))

plot(1, ann = FALSE, axes = FALSE, xlim = c(0, 100), ylim = c(0, 100),
     type = "n", xaxs = "i", yaxs = "i")
title ("DSMgraph_full_6")
text (0,30,"Symptoms that are related to fear and anxiety and", pos=4)
text (0,25,"the number of disorders that feature the symptom", pos=4)

legend (50,90, c("Symptom is not related to fear and anxiety", "1", "2 to 5", "6 to 10", "11 to 15", "16 to 20", "21+"), col= c("white","blue","green","yellow","orange","red","purple") ,pch = 19, xjust=0.5)
legend (50,90, c("Symptom is not related to fear and anxiety", "1", "2 to 5", "6 to 10", "11 to 15", "16 to 20", "21+"), col= c("black") ,pch = 1, xjust=0.5)


