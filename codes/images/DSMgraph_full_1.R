## DSMgraph_full_1
# This shows which chapters of the DSM-IV-TR feature the symptom the most.

g=DSMgraphs.full.graph
l=DSMgraphs.full.layout
adj=DSMgraphs.full.adjacency
s=DSMgraphs.full.DISxSYM

chap1<- matrix (data=NA, nrow = r, ncol = 16)

for (i in 1:r) {chap1[i,1]<- sum(s[i,1:33])}
for (i in 1:r) {chap1[i,2]<- sum(s[i,34:40])}
for (i in 1:r) {chap1[i,3]<- sum(s[i,41:42])}
for (i in 1:r) {chap1[i,4]<- sum(s[i,43:61])}
for (i in 1:r) {chap1[i,5]<- sum(s[i,62:71])}
for (i in 1:r) {chap1[i,6]<- sum(s[i,72:78])}
for (i in 1:r) {chap1[i,7]<- sum(s[i,79:87])}
for (i in 1:r) {chap1[i,8]<- sum(s[i,88:92])}
for (i in 1:r) {chap1[i,9]<- sum(s[i,93:94])}
for (i in 1:r) {chap1[i,10]<- sum(s[i,95:98])}
for (i in 1:r) {chap1[i,11]<- sum(s[i,99:117])}
for (i in 1:r) {chap1[i,12]<- sum(s[i,118:119])}
for (i in 1:r) {chap1[i,13]<- sum(s[i,120:127])}
for (i in 1:r) {chap1[i,14]<- sum(s[i,128:132])}
for (i in 1:r) {chap1[i,15]<- sum(s[i,133:138])}
for (i in 1:r) {chap1[i,16]<- sum(s[i,139:148])}

chap2<- matrix (data=NA, nrow = r, ncol = 16)

for (j in 1:16) { for (i in 1:r) {
    if (chap1[i,j] == max(chap1[i,])) {chap2[i,j]<-1} else {chap2[i,j]<-0} }}

chap22<-rowSums(chap2)

for (j in 1:16) { for (i in 1:r) {
    if (chap2[i,j] == "1") {V(g)$chap[i] <- j}}}

for (i in 1:r) {if (chap22[i] > 1) {V(g)$chap[i] <- 0}}

V(g)$color<- "white"
V(g)[ chap == "1" ]$color <- "yellow"
V(g)[ chap == "2" ]$color <- "cyan"  
V(g)[ chap == "3" ]$color <- "darkgreen"
V(g)[ chap == "4" ]$color <- "green"
V(g)[ chap == "5" ]$color <- "grey"
V(g)[ chap == "6" ]$color <- "deeppink"
V(g)[ chap == "7" ]$color <- "orange"
V(g)[ chap == "8" ]$color <- "lightgoldenrod4"
V(g)[ chap == "9" ]$color <- "darkred"
V(g)[ chap == "10" ]$color <- "lightpink"
V(g)[ chap == "11" ]$color <- "black"
V(g)[ chap == "12" ]$color <- "purple"  
V(g)[ chap == "13" ]$color <- "red"    
V(g)[ chap == "14" ]$color <- "lightgreen"
V(g)[ chap == "15" ]$color <- "chartreuse"
V(g)[ chap == "16" ]$color <- "darkblue"

dev=dev.cur()
if (names(dev)!="pdf") windows(10,5)

par(mar=c(0,0,0,0))
layout(matrix(1:2,nr=1,nc=2))

plot(g,layout=l,edge.color="black",vertex.label=NA)

par(mar=c(5,2,5,2))

plot(1, ann = FALSE, axes = FALSE, xlim = c(0, 100), ylim = c(0, 100),
     type = "n", xaxs = "i", yaxs = "i")
title ("DSMgraph_full_1")
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


