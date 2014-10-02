
R version 3.1.1 (2014-07-10) -- "Sock it to Me"
Copyright (C) 2014 The R Foundation for Statistical Computing
Platform: x86_64-apple-darwin13.1.0 (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

[R.app GUI 1.65 (6784) x86_64-apple-darwin13.1.0]

[Workspace restored from /Users/JimmyBowles/.RData]
[History restored from /Users/JimmyBowles/.Rapp.history]

> library(jpeg)
> library(ggplot2)
> setwd("/Users/JimmyBowles/Documents")
> img <- readJPEG("944.jpeg")
> dim(img)
[1] 194 259   3
> imgRGB <- data.frame(
+ x = rep(1:imgDm[2], each = imgDm[1]),
+ y = rep(imgDm[1]:1, imgDm[2]),
+ R = as.vector(img[,,1]),
+ G = as.vector(img[,,2]),
+ B = as.vector(img[,,3])
+ )
Error in data.frame(x = rep(1:imgDm[2], each = imgDm[1]), y = rep(imgDm[1]:1,  : 
  object 'imgDm' not found
> imgDm <- dim(img)
> imgRGB <- data.frame(
+ x = rep(1:imgDm[2], each = imgDm[1]),
+ y = rep(imgDm[1]:1, imgDm[2]),
+ R = as.vector(img[,,1]),
+ G = as.vector(img[,,2]),
+ B = as.vector(img[,,3])
+ )
> head(imgRGB)
  x   y         R         G         B
1 1 194 0.2823529 0.4313725 0.2078431
2 1 193 0.3294118 0.4784314 0.2549020
3 1 192 0.2901961 0.4392157 0.2156863
4 1 191 0.2784314 0.4274510 0.2039216
5 1 190 0.3607843 0.5098039 0.2862745
6 1 189 0.3647059 0.5019608 0.2823529
> ggplot(data=imgRGB, aes(x=x,y=y,col=G)) + geom_point()
> ggplot(data=imgRGB, aes(x=x,y=y,col=rgb(R,G,B)))+geom_point()+scale_color_identity()
> plotTheme <- function() {
+   theme(
+     panel.background = element_rect(
+       size = 3,
+       colour = "black",
+       fill = "white"),
+     axis.ticks = element_line(
+       size = 2),
+     panel.grid.major = element_line(
+       colour = "gray80",
+       linetype = "dotted"),
+     panel.grid.minor = element_line(
+       colour = "gray90",
+       linetype = "dashed"),
+     axis.title.x = element_text(
+       size = rel(1.2),
+       face = "bold"),
+     axis.title.y = element_text(
+       size = rel(1.2),
+       face = "bold"),
+     plot.title = element_text(
+       size = 20,
+       face = "bold",
+       vjust = 1.5)
+   )
+ }
> kClusters <- 2
> kMeans <- kmeans(imgRGB[, c("R", "G", "B")], centers = kClusters)
> kColors <- rgb(kMeans$centers[kMeans$cluster,])
> ggplot(data = imgRGB, aes(x = x, y = y)) + 
+ geom_point(colour = kColors) +
+ labs(title = paste("k-Means Clustering of", kClusters, "Colors")) +
+ xlab("x") +
+ ylab("y") + 
+ plotTheme()
> kClusters <- 55
> kMeans <- kmeans(imgRGB[, c("R", "G", "B")], centers = kClusters)
> kColors <- rgb(kMeans$centers[kMeans$cluster,])
> ggplot(data = imgRGB, aes(x = x, y = y)) + 
+ geom_point(colour = kColors) +
+ labs(title = paste("k-Means Clustering of", kClusters, "Colors")) +
+ xlab("x") +
+ ylab("y") + 
+ plotTheme()
> kClusters <- 60
> kMeans <- kmeans(imgRGB[, c("R", "G", "B")], centers = kClusters)
Warning message:
did not converge in 10 iterations 
> kClusters <- 59
> kMeans <- kmeans(imgRGB[, c("R", "G", "B")], centers = kClusters)
Warning message:
did not converge in 10 iterations 
> kClusters <- 56
> kMeans <- kmeans(imgRGB[, c("R", "G", "B")], centers = kClusters)
Warning message:
did not converge in 10 iterations 
> kClusters <- 55
> kMeans <- kmeans(imgRGB[, c("R", "G", "B")], centers = kClusters)
> kColors <- rgb(kMeans$centers[kMeans$cluster,])
> ggplot(data = imgRGB, aes(x = x, y = y)) + 
+ geom_point(colour = kColors) +
+ labs(title = paste("k-Means Clustering of", kClusters, "Colors")) +
+ xlab("x") +
+ ylab("y") + 
+ plotTheme()
> 