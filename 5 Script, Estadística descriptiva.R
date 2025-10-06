
# Cargar datos

library(dplyr)
library(readxl)

datos <- read_xlsx("datos_inicial_filtrada.xlsx")

head(datos)

# Se puede usar la función summary() de R base para obtener el resumen de una variable cuantitativa.

# Para acceder a una columna específica (variable) de un dataset se utiliza el símbolo $ 

summary(datos$prom_felicidad)

# La función **describe()** de la librería **psych** entrega más estadísticos descriptivos, 
# donde el argumento na.rm controla si se remueven los datos perdidos (por defecto es TRUE). 


# install.packages("psych")

library(psych)

describe(datos$prom_felicidad, 
         IQR = TRUE)


# Para cambiar el número de dígitos reportados se puede guardar el resultado 
# de describe() en un objeto y cambiar el número con el argumento digits.

deci <- describe(datos$prom_felicidad)

print(deci, 
      digits = 4)

# Es posible obtener estadísticos descriptivos agrupados usando la función describeBy() de la librería psych.

# Los grupos se definen con el argumento group.

describeBy(datos$prom_felicidad,
           group = datos$hijos)


# La función freq() de la librería summarytools crea una tabla con las frecuencias absolutas y relativas de una variable cualitativa.

# install.packages("summarytools")

library(summarytools)

freq(datos$IMC_cat)

# La tabla se puede ordenar según las frecuencias con el argumento order = “freq”.

freq(datos$IMC_cat, 
     order = "freq")

# Tabla de contingencia para dos variables cualitativas

ctable(x = datos$sexo, 
       y = datos$actividad,
       prop = "r",
       headings = FALSE)

# Se pueden omitir los NA de los cálculos de la tabla con el argumento useNA = "no".

ctable(x = datos$sexo, 
       y = datos$actividad,
       prop = "r",
       headings = FALSE,
       useNA = "no")

# También es posible agregar una prueba de chi-cuadrado con el argumento chisq = TRUE.

ctable(x = datos$sexo, 
       y = datos$actividad,
       prop = "r",
       headings = FALSE,
       useNA = "no",
       chisq = TRUE)



