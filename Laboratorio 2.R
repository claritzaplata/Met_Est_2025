temperatura <- read.csv("C:/Users/Usuario.PC14.000/Downloads/temperatura.csv")
View(temperatura)

head(temperatura) #primeras 6 filas
dim(temperatura) #numero de fila y columnas 
names(temperatura) #nombres de las columnas 
str(temperatura)

#Resumen estadistico
summary(temperatura)

#Modificar nombre de columnas 
names(temperatura) <-c("anio","Ene","Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov","Dic") 


names(temperatura)

#Crear columna Media_anual con temperatura media anual
temperatura$Ene
temperatura$media_anual <- rowMeans(temperatura[,2:13])
head(temperatura)

#Crear objeto con medias mensuales de temperatura 
medias_mensuales <- colMeans(temperatura[,2:13])
medias_mensuales
help("boxplot")
boxplot(temperatura$ene,main="temperatura de enero",ylab="c",col="lightblue")

datos_meses <- temperatura[,2:13]
boxplot(datos_meses,main="Temperatura",="c",col="lightgreen",names = c("Ene,"Feb","mar"" ") ")
