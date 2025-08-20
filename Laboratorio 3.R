# Laboratorio Semana 3 
# 20/08/2025
# Claritza Plata Escobedo 


# Importar datos  ---------------------------------------------------------

Temp <- read.csv("temperatura.csv", header = T)  
Temp <- read.csv("Data/medias.temperatura.csv", header = T)


#Ingresar datos de manera normal

edad <- c(18, 19, 18, 18, 25, 19, 18, 18, 18, 17, 19, 19, 18, 17, 19, 18, 19, 19)

alumno <- seq(1,18,1)

info<- data.frame(alumno, edad)

info$altura <- c(174, 174, 170, 160, 158, 155, 188, 170, 175, 170, 172, 170, 174, 180, 158, 161, 188, 164)


# Graficos datos  ---------------------------------------------------------

boxplot(info$altura) #col sirve para colorear la grafica col ="Indianred", # main sirve para poner titulo main ="clase 3 semestre" 
         
colores = c("navajowhite", "indianred", "skyblue" )
boxplot(Temp[,2:13], col=colores) 
# Estadisticas descriptivas -----------------------------------------------



