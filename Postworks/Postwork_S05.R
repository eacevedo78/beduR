# OBJETIVO
# Realizar inferencia estadística para extraer información de la muestra que sea
# contrastable con la población

# REQUISITOS
# Haber desarrollado los postworks anteriores
# Cubrir los temas del prework
# Replicar los ejemplos de la sesión

# DESARROLLO
# El data frame iris contiene información recolectada por Anderson sobre 50
# flores de 3 especies distintas (setosa, versicolor y virginca), incluyendo
# medidas en centímetros del largo y ancho del sépalo así como de los pétalos.

summary(iris)
View(iris)

nc <- 0.01
#Estudios recientes sobre las mismas especies muestran que:
  
# i. En promedio, el largo del sépalo de la especie setosa (Sepal.Length) es
# igual a 5.7 cm
#Ho: mu= 5.7
#Ha: mu!=5.7
t.test(x = iris[iris$Species == "setosa", "Sepal.Length"],
                 alternative = "two.sided", mu = 5.7)
p.value <- 2.2e-16
if(p.value >= nc ){
  cat("NO se rechaza Ho,", p.value,">=",nc)
}else{
  cat("Se rechaza Ho,", p.value,"<",nc)
}

# ii. En promedio, el ancho del pétalo de la especie virginica (Petal.Width)
# es menor a 2.1 cm
#Ho: mu >= 2.1
#Ha: mu < 2.1
t.test(x = iris[iris$Species == "virginica", "Petal.Width"], alternative = "less", mu = 2.1)#p-value = 0.03132
p.value <- 0.03132

if(p.value < nc) {
  paste("Se rechaza Ho, el ancho del pétalo en promedio es mayor a 2.1 cm")
} else{
  paste("No se rechaza Ho, el ancho del pétalo en promedio es menor a 2.1 cm")
}

# iii. En promedio, el largo del pétalo de la especie virgínica es 1.1 cm más
# grande que el promedio del largo del pétalo de la especie versicolor.

virg <- iris[iris$Species == 'virginica', 'Petal.Length']
versi <- iris[iris$Species == 'versicolor', 'Petal.Length']

# Ho: mu <= 1.1
# Ha: mu > 1.1
var.test(virg, versi, alternative = "greater", ratio=1.1)

p.value <- t.test(virg,versi, alternative = 'greater', mu = 0,
                  var.equal = FALSE)$p.value

if (p.value >= nc) { 
  cat('R: No Se Rechaza Ho:', p.value, '>=', nc)
} else {
  cat('R: Se Rechaza: Ho', p.value, '<', nc)
}

# iv. En promedio, no existe diferencia en el ancho del sépalo entre las 3 especies.

# mu0 = mu1 = mu2
# mu0 != mu1 != mu2

boxplot(Sepal.Width ~ Species,
        data = iris)

summary(aov(Sepal.Width ~ Species,
            data = iris))

# Utilizando pruebas de inferencia estadística, concluye si existe evidencia
# suficiente para concluir que los datos recolectados por Anderson están en
# línea con los nuevos estudios.


# Utiliza 99% de confianza para toda las pruebas, en cada caso realiza el
# planteamiento de hipótesis adecuado y concluye.