# Postwork Sesión 1.

#### Objetivo

"El Postwork tiene como objetivo que practiques los comandos básicos aprendidos 
durante la sesión, de tal modo que sirvan para reafirmar el conocimiento. Recuerda 
que la programación es como un deporte en el que se debe practicar, habrá caídas, 
pero lo importante es levantarse y seguir adelante. Éxito"

#### Requisitos
#- Concluir los retos
#- Haber estudiado los ejemplos durante la sesión

#### Desarrollo

"El siguiente postwork, te servirá para ir desarrollando habilidades como si se 
tratara de un proyecto que evidencie el progreso del aprendizaje durante el módulo, 
sesión a sesión se irá desarrollando.
A continuación aparecen una serie de objetivos que deberás cumplir, es un ejemplo 
real de aplicación y tiene que ver con datos referentes a equipos de la liga española 
de fútbol (recuerda que los datos provienen siempre de diversas naturalezas), en 
este caso se cuenta con muchos datos que se pueden aprovechar, explotarlos y generar 
análisis interesantes que se pueden aplicar a otras áreas. Siendo así damos paso a las instrucciones:" 
  
#1. Del siguiente enlace, descarga los datos de soccer de la temporada 2019/2020 de la primera división de la liga española: https://www.football-data.co.uk/spainm.php

#2. Importa los datos a R como un Dataframe. NOTA: No olvides cambiar tu
# dirección de trabajo a la ruta donde descargaste tu archivo
sp1 <- read.csv("SP1.csv")
View(sp1)

#3. Del dataframe que resulta de importar los datos a `R`, extrae las columnas
# que contienen los números de goles anotados por los equipos que jugaron en casa
# (FTHG) y los goles anotados por los equipos que jugaron como visitante (FTAG);
# guárdalos en vectores separados
goles.casa <- sp1$FTHG
goles.visitante <- sp1$FTAG


#4. Consulta cómo funciona la función `table` en `R`. Para ello, puedes ingresar
# los comandos `help("table")` o `?table` para leer la documentación.
?table
help(table)


#5. Responde a las siguientes preguntas:
#  a) ¿Cuántos goles tuvo el partido con mayor empate?
goles.anotados <- 0
goles.empate <- -1
for(i in 1:length(goles.casa)){
  if(goles.casa[i] == goles.visitante [i]){
    goles.anotados <- goles.casa[i] + goles.visitante[i]
    
    if (goles.empate < goles.anotados)
      goles.empate <- goles.anotados
  }
}
paste("Goles del partido con mayor empate: ", goles.empate)

#  b) ¿En cuántos partidos ambos equipos empataron 0 a 0?
empate.cero <- 0

for(i in 1:length(goles.casa)){
  if(goles.casa[i] == 0 & goles.visitante[i] == 0){
    empate.cero <- empate.cero + 1
  }
}
paste("Cantidad de partidos empatados a 0: ", empate.cero)

#  c) ¿En cuántos partidos el equipo local (HG) tuvo la mayor goleada sin dejar que el equipo visitante (AG) metiera un solo gol?
casa.goleada.cero <- 0

for(i in 1:length(goles.casa)){
  if(goles.casa[i] >= 3 && goles.visitante[i] == 0){
    casa.goleada.cero <- casa.goleada.cero + 1
  }
}
paste("Cantidad de partidos el local goleo a 0: ", casa.goleada.cero)

  
#  __Notas para los datos de soccer:__ https://www.football-data.co.uk/notes.txt