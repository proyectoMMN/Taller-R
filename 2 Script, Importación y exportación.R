
# Directorio de trabajo ----

## Para saber qué carpeta está usando R como directorio de grabajo:

getwd()

##  Se puede fijar manualmente el directorio de trabajo con la función setwd():

### setwd("C:/Users/jorge/Desktop/USS TALLER INTRODUCCIÓN R")


# Importación de datos desde Excel -----

## La librería readxl permite importar datos de una hoja Excel.

# install.library("readxl") # solo se instala una vez

## Activar librería

library(readxl)

## Se importan los datos con la función read_excel(), y se asignan al objeto datos_excel.

datos_excel <- read_excel("datos_inicio.xlsx")

# Importación de datos desde SPSS -----

## Para importar datos desde SPSS (extensión .sav) se utiliza la función read_sav() de la librería haven.

# install.packages("haven")  # solo se instala una vez

library(haven)

datos_de_SPSS <- read_sav("datos_inicio.sav")

# Funciones básicas ----

## La función names() sobre el objeto con el dataset entrega los nombres de las variables.

names(datos_excel)

## La función head() sobre el objeto con el dataset entrega la información de las primeras filas.

head(datos_excel)

## La función str() sobre el objeto con el dataset indica los tipos de variables.

str(datos_excel)

### num (o dbl) quiere decir que la variable es numérica.

### chr quiere decir que la variable es de cadena (sus niveles son categorías).

### Los datos chr aparecen entre comillas: 

### “1” es uno como texto, mientras que 1 representa el valor numérico.

### Note que en la variable sexo el -999 se lee como texto ("-999")

# Expoortación de datos ----

## Para exportar datos a formato xlsx (Excel) se usa la función write_xlsx() de la librería writexl:

# install.packages("writexl")

library(writexl)

write_xlsx(datos_excel, path = "datos_inicio2.xlsx")

# Para exportar datos a formato sav (SPSS) se usa la función write_sav() de la librería haven:

write_sav(datos_excel, path = "datos_inicio2.sav")












