## DSMgraph_giant_1
# This shows which chapters of the DSM-IV-TR feature the symptom the most.


g2=DSMgraphs.giant.graph
l2=DSMgraphs.giant.layout
adj2=DSMgraphs.giant.adjacency
s2=sg=DSMgraphs.giant.DISxSYM

rg=nrow(sg)

chap1g<- matrix (data=NA, nrow = rg, ncol = 16)

for (i in 1:rg) {chap1g[i,1]<- sum(sg[i,1:33])}
for (i in 1:rg) {chap1g[i,2]<- sum(sg[i,34:40])}
for (i in 1:rg) {chap1g[i,3]<- sum(sg[i,41:42])}
for (i in 1:rg) {chap1g[i,4]<- sum(sg[i,43:61])}
for (i in 1:rg) {chap1g[i,5]<- sum(sg[i,62:71])}
for (i in 1:rg) {chap1g[i,6]<- sum(sg[i,72:78])}
for (i in 1:rg) {chap1g[i,7]<- sum(sg[i,79:87])}
for (i in 1:rg) {chap1g[i,8]<- sum(sg[i,88:92])}
for (i in 1:rg) {chap1g[i,9]<- sum(sg[i,93:94])}
for (i in 1:rg) {chap1g[i,10]<- sum(sg[i,95:98])}
for (i in 1:rg) {chap1g[i,11]<- sum(sg[i,99:117])}
for (i in 1:rg) {chap1g[i,12]<- sum(sg[i,118:119])}
for (i in 1:rg) {chap1g[i,13]<- sum(sg[i,120:127])}
for (i in 1:rg) {chap1g[i,14]<- sum(sg[i,128:132])}
for (i in 1:rg) {chap1g[i,15]<- sum(sg[i,133:138])}
for (i in 1:rg) {chap1g[i,16]<- sum(sg[i,139:148])}

chap2g<- matrix (data=NA, nrow = rg, ncol = 16)

for (j in 1:16) { for (i in 1:rg) {
    if (chap1g[i,j] == max(chap1g[i,])) {chap2g[i,j]<-1} else {chap2g[i,j]<-0} }}

chap22g<-rowSums(chap2g)

for (i in 1:rg) V(g2)$chap[i]=1

for (j in 1:16) { for (i in 1:rg) {
    if (chap2g[i,j] == "1") {V(g2)$chap[i] <- j}
	}}

for (i in 1:rg) {if (chap22g[i] > 1) {V(g2)$chap[i] <- 0}}

V(g2)$color<- "white"
V(g2)[ chap == "1" ]$color <- "yellow"
V(g2)[ chap == "2" ]$color <- "cyan"  
V(g2)[ chap == "3" ]$color <- "darkgreen"
V(g2)[ chap == "4" ]$color <- "green"
V(g2)[ chap == "5" ]$color <- "grey"
V(g2)[ chap == "6" ]$color <- "deeppink"
V(g2)[ chap == "7" ]$color <- "orange"
V(g2)[ chap == "8" ]$color <- "lightgoldenrod4"
V(g2)[ chap == "9" ]$color <- "darkred"
V(g2)[ chap == "10" ]$color <- "lightpink"
V(g2)[ chap == "11" ]$color <- "black"
V(g2)[ chap == "12" ]$color <- "purple"  
V(g2)[ chap == "13" ]$color <- "red"    
V(g2)[ chap == "14" ]$color <- "lightgreen"
V(g2)[ chap == "15" ]$color <- "chartreuse"
V(g2)[ chap == "16" ]$color <- "darkblue"

dev=dev.cur()
if (names(dev)!="pdf") windows(10,5)

par(mar=c(0,0,0,0))
layout(matrix(1:2,nr=1,nc=2))

plot(g2,layout=l2,edge.color="black",vertex.label=NA)

par(mar=c(5,2,5,2))

plot(1, ann = FALSE, axes = FALSE, xlim = c(0, 100), ylim = c(0, 100),
     type = "n", xaxs = "i", yaxs = "i")
title ("DSMgraph_giant_1")
text (0,95,"Chapter of the DSM that feature the symptom the most", pos=4)
legend (50,90, c("Disorders usually first diagnosed in infancy, childhood or adolescence",
    "Delirium, dementia, and amnesia and other cognitive disorders",
    "Mental disorders due to a general medical condition",
    "Substance-related disorders",
    "Schizophrenia and other psychotic disorders",
    "Mood disorders",
    "Anxiety disorders",
    "Somatoform disorders",
    "Facitious disorders",
    "Dissociative disorders",
    "Sexual and gender identity disorders",
    "Eating disorders",
    "Sleep disorders",
    "Impulse control disorders not elsewhere classified",
    "Adjustment disorders",
    "Personality disorders",
    "Symptom is featured equally in multiple chapters"), col= c("yellow"
    ,"cyan"  
    ,"darkgreen"
    ,"green"
    ,"grey"
    ,"deeppink"
    ,"orange"
    ,"lightgoldenrod4"
    ,"darkred"
    ,"lightpink"
    ,"black"
    ,"purple"  
    ,"red"    
    ,"lightgreen"
    ,"chartreuse"
    ,"darkblue"
    ,"white") ,pch = 16, cex=0.85, xjust=0.5)

legend (50,90, c("Disorders usually first diagnosed in infancy, childhood or adolescence",
    "Delirium, dementia, and amnesia and other cognitive disorders",
    "Mental disorders due to a general medical condition",
    "Substance-related disorders",
    "Schizophrenia and other psychotic disorders",
    "Mood disorders",
    "Anxiety disorders",
    "Somatoform disorders",
    "Facitious disorders",
    "Dissociative disorders",
    "Sexual and gender identity disorders",
    "Eating disorders",
    "Sleep disorders",
    "Impulse control disorders not elsewhere classified",
    "Adjustment disorders",
    "Personality disorders",
    "Symptom is featured equally in multiple chapters"), col= c("black") ,pch = 1, cex=0.85, xjust=0.5)


