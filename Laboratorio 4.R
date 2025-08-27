#Prueba de t 
#caso de Muetras Independientes 
#MGAT
#27/08/2025

#Importardatos de Indice de Calidad 

calidad <- read.csv("DATA/calidad_plantas.csv", header = T) 

calidad$Tratamiento <- as.factor(calidad$Tratamiento) 

boxplot(calidad$IE ~ calidad$Tratamiento, col= colores, xlab = "Tratamientos", ylab = "indice calidad", ylim = c(0.4,1.2), main = "Vivero Iturbide")


# Estadistica descriptiva  ------------------------------------------------
#tapply sirve para obtener un valor cuando contamos con varios grupos 

tapply(calidad$IE, calidad$Tratamiento, mean) 
tapply(calidad$IE, calidad$Tratamiento, var) 

#Observamos que la varianza del grupo fert es 3 veces mas grande que el grupo Control (Ctrl) 

#revisar el comportamiento de los datos
library("ggplot2") 
ggplot(calidad, aes(x = IE, color = Tratamiento))+ geom_density() 
