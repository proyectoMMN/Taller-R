#### Manejo de datos

# Instalar tidyverse

# install.packages("tidyverse)

# También es posible instalar específicamente dplyr

# install.packages("dplyr")

library(dplyr)

# Cargar datos 

library(readxl)

datos <- read_xlsx("datos_inicio.xlsx")

# Se retienen todos los participantes hombres

filter(datos,
       sexo == "Hombre")

# Se retienen todos los participantes con edades iguales o mayores a 25 años.

filter(datos,
       edad >= 25)

# Se retienen todos los participantes hombres y que tienen edades iguales o mayores a 25 años.

filter(datos,
       sexo == "Hombre" & edad >= 25)

# Se retienen todos los participantes hombres o que tienen edades iguales o mayores a 25 años.

filter(datos,
       sexo == "Hombre" | edad >= 25)

# Se filtran a todos los participantes que no están casados(as).

filter(datos,
       !civil == "Casado-a")

# Se seleccionan los primeros tres ítems de felicidad.

select(datos,
       felicidad1, felicidad2, felicidad3)

# También se pueden seleccionar secuencias de columnas que están seguidas en el dataset.

select(datos,
       apoyo1:apoyo6, edad)

# Se seleccionan todas las variables menos la edad.

select(datos,
       -edad)

# Se seleccionan todas las variables menos aquellas que están entre satisfaccion3 y apoyo5.

select(datos,
       -c(satisfaccion3:apoyo5))

# Se seleccionan todas las variables que comienzan con “felicidad”.

select(datos, 
       starts_with("felicidad"))

# Se seleccionan todas las variables que terminan con 2.

select(datos, 
       ends_with("2"))

# Se ordenan los datos de menor a mayor según los niveles de glucosa en sangre.

arrange(datos,
        glucosa_ayuna)

# Las filas de una columna se ordenan de manera decreciente con desc().

arrange(datos, 
        desc(glucosa_ayuna))

# Se mueve la variable IMC después de ID.

relocate(datos, 
         IMC, 
         .after = ID)

# Se mueve la variable IMC antes de ID.

relocate(datos, 
         IMC, 
         .before = ID)

# Se cambia el nombre de sexo a Gender.

rename(datos, 
       Gender = sexo)

# Se selecciona el caso de la fila 9.

slice(datos, 
      9)

# Se seleccionan los casos desde la fila 3 a la fila 8.

slice(datos, 
      3:8)

# Se selecciona al 10% de las personas más jóvenes.

slice_min(datos, 
          edad,
          prop = 0.10)

# Se selecciona al 20% de las personas con mayor edad.

slice_max(datos, 
          edad,
          prop = 0.20)

# Se seleccionan 5 participantes al azar sin reposición.

slice_sample(datos, 
             n = 5, 
             replace = FALSE)

# Se sobreescriben los ítems de felicidad y apoyo social asignando números a sus categorías.

datos <- mutate(datos,
                felicidad1 = case_when(felicidad1 == "No me describe en lo absoluto" ~ 1,
                                       felicidad1 == "2" ~ 2,
                                       felicidad1 == "3" ~ 3,
                                       felicidad1 == "4" ~ 4,
                                       felicidad1 == "5" ~ 5,
                                       felicidad1 == "6"  ~ 6,
                                       felicidad1 == "Me describe completamente"  ~ 7))

datos <- mutate(datos,
                felicidad2 = case_when(felicidad2 == "No me describe en lo absoluto" ~ 1,
                                       felicidad2 == "2" ~ 2,
                                       felicidad2 == "3" ~ 3,
                                       felicidad2 == "4" ~ 4,
                                       felicidad2 == "5" ~ 5,
                                       felicidad2 == "6"  ~ 6,
                                       felicidad2 == "Me describe completamente"  ~ 7))

datos <- mutate(datos,
                felicidad3 = case_when(felicidad3 == "No me describe en lo absoluto" ~ 1,
                                       felicidad3 == "2" ~ 2,
                                       felicidad3 == "3" ~ 3,
                                       felicidad3 == "4" ~ 4,
                                       felicidad3 == "5" ~ 5,
                                       felicidad3 == "6"  ~ 6,
                                       felicidad3 == "Me describe completamente"  ~ 7))

datos <- mutate(datos,
                felicidad4 = case_when(felicidad4 == "No me describe en lo absoluto" ~ 1,
                                       felicidad4 == "2" ~ 2,
                                       felicidad4 == "3" ~ 3,
                                       felicidad4 == "4" ~ 4,
                                       felicidad4 == "5" ~ 5,
                                       felicidad4 == "6"  ~ 6,
                                       felicidad4 == "Me describe completamente"  ~ 7))

datos <- mutate(datos,
                apoyo1 = case_when(apoyo1 == "Nunca" ~ 1,
                                   apoyo1 == "Casi nunca" ~ 2,
                                   apoyo1 == "Algunas veces" ~ 3,
                                   apoyo1 == "Casi siempre" ~ 4,
                                   apoyo1 == "Siempre" ~ 5))

datos <- mutate(datos,
                apoyo2 = case_when(apoyo2 == "Nunca" ~ 1,
                                   apoyo2 == "Casi nunca" ~ 2,
                                   apoyo2 == "Algunas veces" ~ 3,
                                   apoyo2 == "Casi siempre" ~ 4,
                                   apoyo2 == "Siempre" ~ 5))

datos <- mutate(datos,
                apoyo3 = case_when(apoyo3 == "Nunca" ~ 1,
                                   apoyo3 == "Casi nunca" ~ 2,
                                   apoyo3 == "Algunas veces" ~ 3,
                                   apoyo3 == "Casi siempre" ~ 4,
                                   apoyo3 == "Siempre" ~ 5))

datos <- mutate(datos,
                apoyo4 = case_when(apoyo4 == "Nunca" ~ 1,
                                   apoyo4 == "Casi nunca" ~ 2,
                                   apoyo4 == "Algunas veces" ~ 3,
                                   apoyo4 == "Casi siempre" ~ 4,
                                   apoyo4 == "Siempre" ~ 5))

datos <- mutate(datos,
                apoyo5 = case_when(apoyo5 == "Nunca" ~ 1,
                                   apoyo5 == "Casi nunca" ~ 2,
                                   apoyo5 == "Algunas veces" ~ 3,
                                   apoyo5 == "Casi siempre" ~ 4,
                                   apoyo5 == "Siempre" ~ 5))

datos <- mutate(datos,
                apoyo6 = case_when(apoyo6 == "Nunca" ~ 1,
                                   apoyo6 == "Casi nunca" ~ 2,
                                   apoyo6 == "Algunas veces" ~ 3,
                                   apoyo6 == "Casi siempre" ~ 4,
                                   apoyo6 == "Siempre" ~ 5))

# Otra manera de recodificar es creando una nueva variable para los ítems transformados (felicidad1_rec).

mutate(datos,
       felicidad1_rec = case_when(felicidad1 == "No me describe en lo absoluto" ~ 1,
                                  felicidad1 == "2" ~ 2,
                                  felicidad1 == "3" ~ 3,
                                  felicidad1 == "4" ~ 4,
                                  felicidad1 == "5" ~ 5,
                                  felicidad1 == "6"  ~ 6,
                                  felicidad1 == "TMe describe completamente"  ~ 7))

# Se crea el puntaje total de felicidad a partir de la sumatoria de los ítems individuales.

mutate(datos,
       tot_felicidad = felicidad1 + felicidad2 + felicidad3 + felicidad4)

# # Para chequear que el puntaje total está bien construido se guarda el cambio actualizando el objeto "datos"

datos <- mutate(datos,
                tot_felicidad = felicidad1 + felicidad2 + felicidad3 + felicidad4)

datos[, c("felicidad1", "felicidad2", "felicidad3", "felicidad4", "tot_felicidad")]

# Se crea el puntaje total de felicidad a partir del promedio (suma de puntajes dividida por la cantidad de puntajes) de los ítems individuales.

datos <- mutate(datos,
                prom_felicidad = (felicidad1 + felicidad2 + felicidad3 + felicidad4)/4)

datos[, c("felicidad1", "felicidad2", "felicidad3", "felicidad4", "tot_felicidad", "prom_felicidad")]

# Se crea una nueva variable (edad_cate) que tiene tres rangos etarios:
# 18 a los 29 años.
# 30 a los 39 años.
# Más de 40 años.

datos <- mutate(datos,
                edad_cate = case_when(edad >= 18 & edad <= 29 ~ 1,
                                      edad >= 30 & edad <= 39 ~ 2,
                                      edad >= 40 ~ 3))

datos[, c("edad", "edad_cate")]

# Se muestran los valores observados de estado civil.

distinct(datos,
         civil)

# Los datos con cualquier código arbitrario (ej. -999) para identificar datos perdidos deben pasar a formato NA

summary(datos$edad)

# El punto denota a la base de datos completa

mutate(datos,
       across(everything(), 
              ~ ifelse(. %in% c(-999, "-999"), 
                       NA, 
                       .)))

# Se guarda el cambio

datos <- mutate(datos,
                across(everything(), 
                       ~ ifelse(. %in% c(-999, "-999"), 
                                NA, 
                                .)))

# Visualización de datos perdidos

vis_miss(datos,
         sort_miss = TRUE) + theme(axis.text.x = element_text(angle = 45, 
                                                              hjust = 1, 
                                                              vjust = 1, 
                                                              size = 8),
                                   plot.margin = margin(t = 10, 
                                                        r = 10, 
                                                        b = 50, 
                                                        l = 10))


# Se puede filtrar excluyendo casos con datos perdidos en una variable.

filter(datos, 
       !is.na(edad))

# También es posible remover todos los casos con datos perdidos de un dataset con la función complete.cases().

filter(datos, 
       complete.cases(datos))

# %>% toma el objeto a la izquierda y lo pasa como el primer argumento de la función especificada a la derecha.

# Esto: 

filter(datos,
       sexo == "Mujer")

# Es lo mismo que:

datos %>% filter(sexo == "Mujer")

# Con el siguiente código:
# a) Se filtran a las mujeres sin hijos.
# b) Se selecciona el puntaje total de felicidad y los ítems de apoyo social.
# c) Se crea un puntaje total de apoyo social percibido.
# d) Se eliminan los casos con datos perdidos.

datos %>% filter(sexo == "Mujer" & hijos == "No") %>% 
          select(tot_felicidad, apoyo1, apoyo2, apoyo3, apoyo4, apoyo5, apoyo6) %>% 
          mutate(tot_apoyo = apoyo1 + apoyo2 + apoyo3 + apoyo4 + apoyo5 + apoyo6) %>% 
          filter(complete.cases(.))






