# OBJETIVO
# - Realizar un analisis estadistico completo de un caso
# - Pubicar en un repositorio de Github el análisis y el código empleado

# REQUISITOS
# - Haber realizado los works y postworks previos
# - Tener una cuenta en Github o en RStudioCloud

# DESARROLLO
# Un centro de salud nutricional está interesado en analizar estadísticamente
# y probabilisticamente los patrones de gasto en alimentos saludables y 
# no saludables en los hogares mexicanos con base en su nivel socioeconómico,
# en si el hogar tiene recursos financieros extras al ingreso y en si presenta
# o no inseguridad alimentaria. Además, está interesado en un modelo que le
# permita identificar los determinantes socioeconómicos de la inseguridad
# alimentaria.
# La base de datos es un extracto de la Encuesta nacional de Salud y Nutrición
# (2012) levantada por el Instituto Nacional de Salud Pública en México.
# La mayoría de las personas afirman que los hogares con menor nivel socioeconómico
# tienden a gastar más en productos no saludables que las personas con mayores
# niveles socioeconómicos y que esto, entre otros determinantes, lleva a que un
# hogar presente cierta inseguridad alimentaria.

# La base de datos contiene las siguientes variables
# -nse5f (Nivel socioeconómico del hogar) 1 Bajo, 2 Medio bajo, 3 Medio, 4 Medio Alto, 5 Alto
# -area (Zona Geografica) 0 Zona Urbana, 1 Zona Rural
# -numpeho (Número de personas en el hogar)
# -refin (Recursos financieros distintos al ingreso laboral) 0 "no", 1 "si"
# -edadjef (Edad del jefe/a de familia)
# -sexoje (Sexo del jefe/a de familia) 0 "Hombre", 1 "Mujer"
# -añosedu (Años de educación del jefe de familia)
# -ln_als (Logaritmo natural del gasto en alimentos saludables)
# -ln_alns (Logaritmo natural del gasto en alimentos no saludables)
# -IA (Inseguridad alimentaria en el hogar) 0 "No presenta IA", 1 "Presenta IA"

# 1. Plantea el problema del caso
# 2. Realiza un análisis descriptivo de la información
# 3. Calcula probabilidades que nos permitan entender el problema en México 
# 4. Plantea hipótesis estadísticas y concluye sobre ellas para entenderl el problema en México
# 5. Estima un modelo de regresión, lineal o logístico, para identificar los
#    determinantes de la inseguridad alimentaria en México
# 6. Escribe tu análisis en un archivo README.MD y tu código en un script de R
#    y publica ambos en un repositorio de Github.
# NOTA: Todo tu planteamiento deberá estár correctamente desarrollado y deberás
#       analizar e interpretar todos tus resultados para poder dar una conclusión
#       final al problema planteado.


df <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-R-Santander-2022/main/Sesion-08/Postwork/inseguridad_alimentaria_bedu.csv")
View(df)


