library(readr)
iris <- read_csv("iris.csv")
clusters <- hclust(dist(iris[, 3:4]))
plot(clusters)

clusterCut <- cutree(clusters, 3)

table(clusterCut, iris$class)
clusters <- hclust(dist(iris[, 3:4]), method = 'average')
plot(clusters)

clusterCut <- cutree(clusters, 3)
table(clusterCut, iris$class)

library(ggplot2)
ggplot(iris, aes(petal_length, petal_width, color = iris$class)) + 
  geom_point(alpha = 0.4, size = 3.5) + geom_point(col = clusterCut) + 
  scale_color_manual(values = c('blue', 'purple', 'green'))
