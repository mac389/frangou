## DSMgraph_full_7
#this shows every symptom that is related to eating
# and hunger dysfunction.

g=DSMgraphs.full.graph
l=DSMgraphs.full.layout
adj=DSMgraphs.full.adjacency
s=DSMgraphs.full.DISxSYM

dis1<- rowSums(s)
eten<-read.table("DSMgraphs/data/hunger.txt")


for (i in 1:r){V(g)$eten[i]<-(eten[i,]*dis1[i])}

V(g)$color<-"white"
V(g)[ eten == "1" ]$color <- "blue"
V(g)[ eten == "2" ]$color <- "green"
V(g)[ eten == "3" ]$color <- "green"
V(g)[ eten == "4" ]$color <- "green"
V(g)[ eten == "5" ]$color <- "green"
V(g)[ eten == "6" ]$color <- "yellow"
V(g)[ eten == "7" ]$color <- "yellow"
V(g)[ eten == "8" ]$color <- "yellow"
V(g)[ eten == "9" ]$color <- "yellow"
V(g)[ eten == "10" ]$color <- "yellow"
V(g)[ eten == "11" ]$color <- "orange"
V(g)[ eten == "12" ]$color <- "orange"
V(g)[ eten == "13" ]$color <- "orange"
V(g)[ eten == "14" ]$color <- "orange"
V(g)[ eten == "15" ]$color <- "orange"
V(g)[ eten == "16" ]$color <- "red"
V(g)[ eten == "17" ]$color <- "red"
V(g)[ eten == "18" ]$color <- "red"
V(g)[ eten == "19" ]$color <- "red"
V(g)[ eten == "20" ]$color <- "red"
V(g)[ eten == "21" ]$color <- "purple"
V(g)[ eten > 21 ]$color <- "purple"

dev=dev.cur()
if (names(dev)!="pdf") windows(10,5)

par(mar=c(0,0,0,0))
layout(matrix(1:2,nr=1,nc=2))

plot(g,layout=l,edge.color="black",vertex.label=NA)


par(mar=c(5,2,5,2))


plot(1, ann = FALSE, axes = FALSE, xlim = c(0, 100), ylim = c(0, 100),
     type = "n", xaxs = "i", yaxs = "i")
title ("DSMgraph_full_7")
text (0,30,"Symptoms that are related to eating and hunger dysfunction", pos=4)
text (0,25,"and the number of disorders that feature the symptom", pos=4)
legend (50,90, c("Symptom is not related to eating and hunger dysfunction", "1", "2 to 5", "6 to 10", "11 to 15", "16 to 20", "21+"), col= c("white","blue","green","yellow","orange","red","purple") ,pch = 19, xjust=0.5)
legend (50,90, c("Symptom is not related to eating and hunger dysfunction", "1", "2 to 5", "6 to 10", "11 to 15", "16 to 20", "21+"), col= c("black") ,pch = 1, xjust=0.5)


