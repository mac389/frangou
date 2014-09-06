## DSMgraph_MDEGAD1_1
# MDE, GAD and connected symptoms

gMDEnGAD=DSMgraphs.MDEGAD1.graph
lMDEnGAD2=DSMgraphs.MDEGAD1.layout
adjMDEnGAD=DSMgraphs.MDEGAD1.adjacency


V(gMDEnGAD)$color <- "white"
V(gMDEnGAD)[ MDEcon > 0 ]$color <- "cyan"  
V(gMDEnGAD)[ GADcon > 0 ]$color <- "orange"
V(gMDEnGAD)[ MDEcon > 0 & GADcon > 0]$color <- "green"    
V(gMDEnGAD)[ MDE == "1" ]$color <- "blue"  
V(gMDEnGAD)[ GAD == "1" ]$color <- "red"
V(gMDEnGAD)[ MDE == "1" & GAD == "1"]$color <- "purple"

dev=dev.cur()
if (names(dev)!="pdf") windows(10,5)

par(mar=c(0,0,0,0))
layout(matrix(1:2,nr=1,nc=2))

plot(gMDEnGAD,layout=lMDEnGAD2,edge.color="black",vertex.label=NA)

par(mar=c(5,2,5,2))

plot(1, ann = FALSE, axes = FALSE, xlim = c(0, 100), ylim = c(0, 100),
     type = "n", xaxs = "i", yaxs = "i")
title ("DSMgraph_MDEGAD1_1")
legend (50,90, c("Symptom is a symptom of MDE",
    "Symptom is a symptom of GAD",
    "Symptom is a shared symptom of MDE and GAD",
    "Symptom is connected to MDE",
    "Symptom is connected to GAD",
    "Symptom is connected to MDE and GAD"), col= c("blue","red","purple","cyan", "orange", "green") ,pch = 19, xjust=0.5)
legend (50,90, c("Symptom is a symptom of MDE",
    "Symptom is a symptom of GAD",
    "Symptom is a shared symptom of MDE and GAD",
    "Symptom is connected to MDE",
    "Symptom is connected to GAD",
    "Symptom is connected to MDE and GAD"), col= c("black") ,pch = 1, xjust=0.5)
