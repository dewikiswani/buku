### cluster non hirarki

library(tidyverse)  # data manipulation
library(cluster)    # clustering algorithms
library(factoextra) # clustering visualization
library(dendextend) # for comparing two dendrograms

ilustrasi<-read.csv("C:/dw/buku/buku R dan python/buku/data/PDRB INDONESIA.csv",
                    header=T, sep=",")
nama <- ilustrasi[,1]
isi <- ilustrasi[,2:4]
rownames(isi) <- nama
df <- na.omit(isi)
df <- scale(df)

# methods to assess
m <- c( "average", "single", "complete", "ward")
names(m) <- c( "average", "single", "complete", "ward")

# function to compute coefficient
ac <- function(x) {
  agnes(df, method = x)$ac
}

c<-map_dbl(m, ac)

#function untuk dendogram 
library(cluster)
df <- na.omit(USArrests)
df <- scale(df)
m <- c( "average", "single", "complete", "ward")
for (i in m){
  cward <- agnes(df, method = m)
  pltree(cward, cex = 0.6, hang = -1, main = "Dendrogram of $i.")  
}


