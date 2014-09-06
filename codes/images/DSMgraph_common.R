# DSMgraph_common
# This scrit creates several text files about the common disorders



g=DSMgraphs.full.graph
l=DSMgraphs.full.layout
adj=DSMgraphs.full.adjacency
s=DSMgraphs.full.DISxSYM
r=nrow(adj)

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

for (i in 1:r){V(g)$common[i]<-common[i,11]}


commonshortestpaths<-matrix(data = NA, nrow = 10, ncol = 10)
sp<- shortest.paths(g)
for (j in 1:10) { for (i in 1:10) {commonshortestpaths[i,j]<-mean(sp[(common[,i] == "1"),(common[,j] == "1")])}}
for (i in 1:10) {commonshortestpaths[i,i]<-NA}
rownames(commonshortestpaths)<-c("MDE","DYS","AGPH","SOP","SIP","GAD","PD","AD","DD","APD")
colnames(commonshortestpaths)<-c("MDE","DYS","AGPH","SOP","SIP","GAD","PD","AD","DD","APD")
write.table(commonshortestpaths, file = "DSMgraphs/output/commonshortestpaths.txt", append = FALSE, sep = "/", row.names = TRUE, col.names = TRUE, eol = "\n", na = "NA", dec = ".")


# This creates "commonshared.txt" in which is shown how much shared symptoms
# the common disorders have.

commonshared<-matrix(NA,ncol=10,nrow=10)
rownames(commonshared)<-c("MDE","DYS","AGPH","SOP","SIP","GAD","PD","AD","DD","APD")
colnames(commonshared)<-c("MDE","DYS","AGPH","SOP","SIP","GAD","PD","AD","DD","APD")
for (j in 1:10) { for (i in 1:10) {
    commonshared[i,j] <- sum(common[,i]*common[,j]) }}
for (i in 1:10) {commonshared[i,i] <- "ALL"}
write.table(commonshared, file = "DSMgraphs/output/commonshared.txt", append = FALSE, sep = "/", row.names = TRUE, col.names = TRUE, eol = "\n", na = "NA", dec = ".")



for (j in i:16) { for (i in 1:r) {
    if (chap1[i,j] == max(chap1[i,])) {chap2[i,j]<-1} else {chap2[i,j]<-0} }}          


# This creates "commoncorr_aspl.txt" which is a table that shows empirical correlations
# for every pair of common disorders and the average shortest pathlength for every
# pair of common disorders

commoncorr1<-matrix (data=NA, nrow= 45, ncol = 2)
commoncorr2<-read.table("DSMgraphs/data/commoncorr.txt")
commoncorr3<-read.table("DSMgraphs/data/commondisxdis.txt")
rownames(commoncorr1)<-commoncorr3[,2]
colnames(commoncorr1)<-c("Correlation","Average shortest pathlength")
commoncorr1[,1]<-commoncorr2[,1]
commoncorr1[1:9,2] <- commonshortestpaths[2:10,1]
commoncorr1[10:17,2] <- commonshortestpaths[3:10,2]
commoncorr1[18:24,2] <- commonshortestpaths[4:10,3]
commoncorr1[25:30,2] <- commonshortestpaths[5:10,4]
commoncorr1[31:35,2] <- commonshortestpaths[6:10,5]
commoncorr1[36:39,2] <- commonshortestpaths[7:10,6]
commoncorr1[40:42,2] <- commonshortestpaths[8:10,7]
commoncorr1[43:44,2] <- commonshortestpaths[9:10,8]
commoncorr1[45,2] <- commonshortestpaths[10,9]

write.table(commoncorr1, file = "DSMgraphs/output/commoncorr_aspl.txt", append = FALSE, sep = "/", row.names = TRUE, col.names = TRUE, eol = "\n", na = "NA", dec = ".")

# This creates "scatter_corr_aspl.pdf". This is a scatterplot for empirical correlations between
# every pair of common disorders and the average shortest pathlength for every
# pair of common disorders.

layout(1)
plot(commoncorr1)