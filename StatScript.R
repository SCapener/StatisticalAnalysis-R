
# Running Basic Statistical Analysis in R
# YouTube tutorial: https://www.youtube.com/watch?v=I6FJo8x1wZE

# Load data set - Iris dataset is built-in to R

data <- iris

# Select a column
data$Sepal.Length

# Save result to a new variable

x <- data$Sepal.Length
x

# Get mean and median

mean(x)
median(x)

# Run Pearson Correlation

cor(iris$Sepal.Length, iris$Petal.Length, method = "pearson")
# A fairly strong positive relationship

# Plot the data
plot(iris$Sepal.Length, iris$Petal.Length, col="blue")

# Regression - Linear regression model

model <- lm(iris$Petal.Length~iris$Sepal.Length, data=data)
summary(model)

# Plot data

abline(lm(iris$Petal.Length~ iris$Sepal.Length, data = data))

# Comparison - T-test
# For petal length of Setosa and petal length of Virginica

data1 <- subset(data$Petal.Length, data$Species == "setosa")
data2 <- subset(data$Petal.Length, data$Species == "virginica")

t.test(data1, data2)
# p-value low - significant difference in petal length between two groups

# Comparison - ANOVA
aov.model <- aov(Petal.Length ~ Species, data = data)
summary(aov.model)
# p-value low - significant difference

# Data visualisation: Heatmaps with Hierarchical Clustering
install.packages("pheatmap")
library(pheatmap)
# Select first 4 columns
pheatmap(data[,1:4], cluster_rows = TRUE, cluster_cols = TRUE, clustering_method = "complete")
# Sepal width and petal length closer related to each other, whereas sepal length is furthest away

# PCA with FactorMineR - good for multidimensional data and want to know which columns are most important

install.packages(c("FactoMineR", "factoextra"))
library(FactoMineR)
library(factoextra)

data.pca <- PCA(data[,1:4], scale.unit = TRUE, ncp = 5)
# Can see sepal width is very far away from other 3 columns
fviz_pca_ind(data.pca, col.ind = data$Species)
# Plot individual flowers as individual points and colour by species
# Versicolour and Virginica quite close together, compared to Setosa
