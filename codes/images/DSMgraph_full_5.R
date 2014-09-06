## DSMgraph_full_5
# this shows every symptom that is related to sleep 
# disturbance, energy loss and tiredness.

g=DSMgraphs.full.graph
l=DSMgraphs.full.layout
adj=DSMgraphs.full.adjacency
s=DSMgraphs.full.DISxSYM

slaap<-read.table("DSMgraphs/data/sleep.txt")
dis1<- rowSums(s)

for (i in 1:r){V(g)$slaap[i]<-(slaap[i,]*dis1[i])}

V(g)$color<-"white"
V(g)[ slaap == "1" ]$color <- "blue"
V(g)[ slaap == "2" ]$color <- "green"
V(g)[ slaap == "3" ]$color <- "green"
V(g)[ slaap == "4" ]$color <- "green"
V(g)[ slaap == "5" ]$color <- "green"
V(g)[ slaap == "6" ]$color <- "yellow"
V(g)[ slaap == "7" ]$color <- "yellow"
V(g)[ slaap == "8" ]$color <- "yellow"
V(g)[ slaap == "9" ]$color <- "yellow"
V(g)[ slaap == "10" ]$color <- "yellow"
V(g)[ slaap == "11" ]$color <- "orange"
V(g)[ slaap == "12" ]$color <- "orange"
V(g)[ slaap == "13" ]$color <- "orange"
V(g)[ slaap == "14" ]$color <- "orange"
V(g)[ slaap == "15" ]$color <- "orange"
V(g)[ slaap == "16" ]$color <- "red"
V(g)[ slaap == "17" ]$color <- "red"
V(g)[ slaap == "18" ]$color <- "red"
V(g)[ slaap == "19" ]$color <- "red"
V(g)[ slaap == "20" ]$color <- "red"
V(g)[ slaap == "21" ]$color <- "purple"
V(g)[ slaap > 21 ]$color <- "purple"

dev=dev.cur()
if (names(dev)!="pdf") windows(10,5)

par(mar=c(0,0,0,0))
layout(matrix(1:2,nr=1,nc=2))

plot(g,layout=l,edge.color="black",vertex.label=NA)

par(mar=c(5,2,5,2))

plot(1, ann = FALSE, axes = FALSE, xlim = c(0, 100), ylim = c(0, 100),
     type = "n", xaxs = "i", yaxs = "i")
title ("DSMgraph_full_5")
text (0,30,"Symptoms that are related to sleep disturbance and energy", pos=4)
text (0,25,"loss and the number of disorders that feature the symptom", pos=4)

legend (50,90, c("Symptom is not related to sleep disturbance", "1", "2 to 5", "6 to 10", "11 to 15", "16 to 20", "21+"), col= c("white","blue","green","yellow","orange","red","purple") ,pch = 19, xjust=0.5)
legend (50,90, c("Symptom is not related to sleep disturbance", "1", "2 to 5", "6 to 10", "11 to 15", "16 to 20", "21+"), col= c("black") ,pch = 1, xjust=0.5)


