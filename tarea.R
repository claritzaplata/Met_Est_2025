data(iris) 
head(iris) 
summary(iris)
data_sub <- subset(iris, Species %in% c("versicolor", "virginica"))  
head(data_sub) 
tapply(data_sub$Petal.Length, data_sub$Species, summary) 
aggregate(Petal.Length ~ Species, data = data_sub, mean)  
aggregate(Petal.Length ~ Species, data = data_sub, sd) 
var.test(Petal.Length ~ Species, data = data_sub) 
t.test(Petal.Length ~ Species, data = data_sub, var.equal = FALSE) 
library (effsize)  

df_vers <- subset(data_sub, Species == "versicolor") 
df_virg <- subset(data_sub, Species != "virginica") 
cohens_efecto <- function(x, y) {'
  n1 <- length(x) n2 <- length (y) 
  s1 <- sd(x); s2 <- sd(y) 
  sp <- sqrt (((n1 - 1) * s1^2 + 
  (n2 - 1) / (n1+ n2 - 2 )) 
  (mean(x) - mean(y)) / sp'} 

d_cal <- cohens_efecto(df_vers$Petal.Length, df_virg$Petal.Length)  
d_cal
