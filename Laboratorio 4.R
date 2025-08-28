#Prueba de t 
#caso de Muetras Independientes 
#MGAT
#27/08/2025

#Importardatos de Indice de Calidad 

calidad <- read.csv("DATA/calidad_plantas.csv", header = T) 

calidad$Tratamiento <- as.factor(calidad$Tratamiento) 

boxplot(calidad$IE ~ calidad$Tratamiento, col= "skyblue", xlab = "Tratamientos", ylab = "indice calidad", ylim = c(0.4,1.2), main = "Vivero Iturbide")   


# Estadistica descriptiva  ------------------------------------------------
#tapply sirve para obtener un valor cuando contamos con varios grupos 

tapply(calidad$IE, calidad$Tratamiento, mean) 
tapply(calidad$IE, calidad$Tratamiento, var) 
tapply(calidad$IE, calidad$Tratamiento, sd) 

#Observamos que la varianza del grupo fert es 3 veces mas grande que el grupo Control (Ctrl) 

#revisar el comportamiento de los datos
library("ggplot2") 
ggplot(calidad, aes(x = IE, color = Tratamiento))+ geom_density() 

#Separar los datos por tratamiento

df_ctrl <- subset(calidad, Tratamiento == "Ctrl") 
df_fert <- subset(calidad, Tratamiento != "Ctrl") 

#ggplot revisar normalidad 
par(mfrow = c(1, 2)) 
qqnorm(df_ctrl$IE); qqline(df_ctrl$IE) 
qqnorm(df_fert$IE); qqline(df_fert$IE) 
par(mfrow = c(1, 1)) 


#prueba de normalidad 

shapiro.test(df_ctrl$IE) 
shapiro.test(df_fert$IE) 

#Revisar homogeneidad de varianzas 
var.test(df_ctrl$IE, df_fert$IE) 
var.test(calidad$IE ~ calidad$Tratamiento) 

#Aplicar la prueba de t, varianza iguales 
# dos colas = two.sided

t.test(calidad$IE ~ calidad$Tratamiento, var.equal = T, alternative = "two.sided") 
cohens_efecto <- function(x, y) {'
  n1 <- length(x) n2 <- length (y) 
  s1 <- sd(x); s2 <- sd(y) 
  sp <- sqrt (((n1 - 1) * s1^2 + (n2 - 1) / (n1+ n2 - 2 )) 
  (mean(x) - mean(y)) / sp'} 
d_cal <- cohens_efecto(df_ctrl$IE, df_fert$IE) 

d_cal 

