## DSMgraph_full_8
# this shows every symptom that is related to sexual
# dysfunction

g=DSMgraphs.full.graph
l=DSMgraphs.full.layout
adj=DSMgraphs.full.adjacency
s=DSMgraphs.full.DISxSYM

dis1<- rowSums(s)
sex<-read.table("DSMgraphs/data/sex.txt")


for (i in 1:r){V(g)$sex[i]<-(sex[i,]*dis1[i])}

V(g)$color<-"white"
V(g)[ sex == "1" ]$color <- "blue"
V(g)[ sex == "2" ]$color <- "green"
V(g)[ sex == "3" ]$color <- "green"
V(g)[ sex == "4" ]$color <- "green"
V(g)[ sex == "5" ]$color <- "green"
V(g)[ sex == "6" ]$color <- "yellow"
V(g)[ sex == "7" ]$color <- "yellow"
V(g)[ sex == "8" ]$color <- "yellow"
V(g)[ sex == "9" ]$color <- "yellow"
V(g)[ sex == "10" ]$color <- "yellow"
V(g)[ sex == "11" ]$color <- "orange"
V(g)[ sex == "12" ]$color <- "orange"
V(g)[ sex == "13" ]$color <- "orange"
V(g)[ sex == "14" ]$color <- "orange"
V(g)[ sex == "15" ]$color <- "orange"
V(g)[ sex == "16" ]$color <- "red"
V(g)[ sex == "17" ]$color <- "red"
V(g)[ sex == "18" ]$color <- "red"
V(g)[ sex == "19" ]$color <- "red"
V(g)[ sex == "20" ]$color <- "red"
V(g)[ sex == "21" ]$color <- "purple"
V(g)[ sex > 21 ]$color <- "purple"

dev=dev.cur()
if (names(dev)!="pdf") windows(10,5)

par(mar=c(0,0,0,0))
layout(matrix(1:2,nr=1,nc=2))

plot(g,layout=l,edge.color="black",vertex.label=NA)

par(mar=c(5,2,5,2))

plot(1, ann = FALSE, axes = FALSE, xlim = c(0, 100), ylim = c(0, 100),
     type = "n", xaxs = "i", yaxs = "i")
title ("DSMgraph_full_8")
text (0,30,"Symptoms that are related to sexual dysfunction and", pos=4)
text (0,25,"the number of disorders that feature the symptom", pos=4)
legend (50,90, c("Symptom is not related to sexual dysfunction", "1", "2 to 5", "6 to 10", "11 to 15", "16 to 20", "21+"), col= c("white","blue","green","yellow","orange","red","purple") ,pch = 19, xjust=0.5)
legend (50,90, c("Symptom is not related to sexual dysfunction", "1", "2 to 5", "6 to 10", "11 to 15", "16 to 20", "21+"), col= c("black") ,pch = 1, xjust=0.5)


