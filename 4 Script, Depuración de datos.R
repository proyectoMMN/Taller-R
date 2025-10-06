# Depuración de la base de datos ------

# Datos perdidos y respuesta inválidas ----

library(dplyr)
library(readxl)

datos <- read_xlsx("datos_inicio.xlsx")

head(datos)

## Primero se reemplazan todos los datos -999 por NA

datos <- mutate(datos,
                across(everything(), 
                       ~ ifelse(. %in% c(-999, 
                                         "-999"), 
                                NA, 
                                .)))

## Ordenamos los datos por edad (dos casos tienen edades inválidas)

datos <- datos %>% arrange(desc(edad))

head(datos)

## Se remueven casos con edades inválidas

datos <- datos %>% filter(edad <= 100)


# Recodificación de variables ----

## El nivel educativo debe estar codificado con números para ser analizado

datos <- datos %>% mutate(educacion = case_when(educacion == "Básica incompleta" ~ 1,
                                                educacion == "Básica completa" ~ 2,
                                                educacion == "Media incompleta" ~ 3,
                                                educacion == "Media completa" ~ 4,
                                                educacion == "Superior incompleta" ~ 5,
                                                educacion == "Superior completa" ~ 6))

## El estado civil tiene demasiadas categorías y varias son similares

unique(datos$civil)

## Se agruparan casos con y sin relación en una misma categoría

datos <- datos %>% mutate(civil_rec = case_when(civil == "Casado-a" ~ 1,
                                                civil == "Soltero-a con relación" ~ 2,
                                                civil == "Soltero-a sin relación" ~ 2,
                                                civil == "Separado-a/Divorciado-a/Anulado-a sin relación" ~ 3,
                                                civil == "Separado-a/Divorciado-a/Anulado-a con relación" ~ 3,
                                                civil == "Viudo-a sin relación" ~ 4,
                                                civil == "Viudo-a con relación" ~ 4))

### Casado = 1
### Soltero = 2
### Separado/Divorciado = 3
### Viudo = 4

## Recodificación de ítems de satisfacción con la vida 

unique(datos$satisfaccion1)

datos <- datos %>% mutate(satisfaccion1 = case_when(satisfaccion1 == "Totalmente en desacuerdo" ~ 1,
                                                    satisfaccion1 == "Ligeramente en desacuerdo" ~ 2,
                                                    satisfaccion1 == "En desacuerdo" ~ 3,
                                                    satisfaccion1 == "Ni de acuerdo ni en desacuerdo" ~ 4,
                                                    satisfaccion1 == "Ligeramente de acuerdo" ~ 5,
                                                    satisfaccion1 == "De acuerdo" ~ 6,
                                                    satisfaccion1 == "Totalmente de acuerdo" ~ 7))

datos <- datos %>% mutate(satisfaccion2 = case_when(satisfaccion2 == "Totalmente en desacuerdo" ~ 1,
                                                    satisfaccion2 == "Ligeramente en desacuerdo" ~ 2,
                                                    satisfaccion2 == "En desacuerdo" ~ 3,
                                                    satisfaccion2 == "Ni de acuerdo ni en desacuerdo" ~ 4,
                                                    satisfaccion2 == "Ligeramente de acuerdo" ~ 5,
                                                    satisfaccion2 == "De acuerdo" ~ 6,
                                                    satisfaccion2 == "Totalmente de acuerdo" ~ 7))

datos <- datos %>% mutate(satisfaccion3 = case_when(satisfaccion3 == "Totalmente en desacuerdo" ~ 1,
                                                    satisfaccion3 == "Ligeramente en desacuerdo" ~ 2,
                                                    satisfaccion3 == "En desacuerdo" ~ 3,
                                                    satisfaccion3 == "Ni de acuerdo ni en desacuerdo" ~ 4,
                                                    satisfaccion3 == "Ligeramente de acuerdo" ~ 5,
                                                    satisfaccion3 == "De acuerdo" ~ 6,
                                                    satisfaccion3 == "Totalmente de acuerdo" ~ 7))

datos <- datos %>% mutate(satisfaccion4 = case_when(satisfaccion4 == "Totalmente en desacuerdo" ~ 1,
                                                    satisfaccion4 == "Ligeramente en desacuerdo" ~ 2,
                                                    satisfaccion4 == "En desacuerdo" ~ 3,
                                                    satisfaccion4 == "Ni de acuerdo ni en desacuerdo" ~ 4,
                                                    satisfaccion4 == "Ligeramente de acuerdo" ~ 5,
                                                    satisfaccion4 == "De acuerdo" ~ 6,
                                                    satisfaccion4 == "Totalmente de acuerdo" ~ 7))

datos <- datos %>% mutate(satisfaccion5 = case_when(satisfaccion5 == "Totalmente en desacuerdo" ~ 1,
                                                    satisfaccion5 == "Ligeramente en desacuerdo" ~ 2,
                                                    satisfaccion5 == "En desacuerdo" ~ 3,
                                                    satisfaccion5 == "Ni de acuerdo ni en desacuerdo" ~ 4,
                                                    satisfaccion5 == "Ligeramente de acuerdo" ~ 5,
                                                    satisfaccion5 == "De acuerdo" ~ 6,
                                                    satisfaccion5 == "Totalmente de acuerdo" ~ 7))

## Recodificación de ítems de apoyo social

datos <- datos %>% mutate(apoyo1 = case_when(apoyo1 == "Nunca" ~ 1,
                                             apoyo1 == "Casi nunca" ~ 2,
                                             apoyo1 == "Algunas veces" ~ 3,
                                             apoyo1 == "Casi siempre" ~ 4,
                                             apoyo1 == "Siempre" ~ 5))

datos <- datos %>% mutate(apoyo2 = case_when(apoyo2 == "Nunca" ~ 1,
                                             apoyo2 == "Casi nunca" ~ 2,
                                             apoyo2 == "Algunas veces" ~ 3,
                                             apoyo2 == "Casi siempre" ~ 4,
                                             apoyo2 == "Siempre" ~ 5))

datos <- datos %>% mutate(apoyo3 = case_when(apoyo3 == "Nunca" ~ 1,
                                             apoyo3 == "Casi nunca" ~ 2,
                                             apoyo3 == "Algunas veces" ~ 3,
                                             apoyo3 == "Casi siempre" ~ 4,
                                             apoyo3 == "Siempre" ~ 5))

datos <- datos %>% mutate(apoyo4 = case_when(apoyo4 == "Nunca" ~ 1,
                                             apoyo4 == "Casi nunca" ~ 2,
                                             apoyo4 == "Algunas veces" ~ 3,
                                             apoyo4 == "Casi siempre" ~ 4,
                                             apoyo4 == "Siempre" ~ 5))

datos <- datos %>% mutate(apoyo5 = case_when(apoyo5 == "Nunca" ~ 1,
                                             apoyo5 == "Casi nunca" ~ 2,
                                             apoyo5 == "Algunas veces" ~ 3,
                                             apoyo5 == "Casi siempre" ~ 4,
                                             apoyo5 == "Siempre" ~ 5))

datos <- datos %>% mutate(apoyo6 = case_when(apoyo6 == "Nunca" ~ 1,
                                             apoyo6 == "Casi nunca" ~ 2,
                                             apoyo6 == "Algunas veces" ~ 3,
                                             apoyo6 == "Casi siempre" ~ 4,
                                             apoyo6 == "Siempre" ~ 5))

## Recodificación de ítems de felicidad

datos <- datos %>% mutate(felicidad1 = case_when(felicidad1 == "No me describe en lo absoluto" ~ 1,
                                                 felicidad1 == "2" ~ 2,
                                                 felicidad1 == "3" ~ 3,
                                                 felicidad1 == "4" ~ 4,
                                                 felicidad1 == "5" ~ 5,
                                                 felicidad1 == "6" ~ 6,
                                                 felicidad1 == "Me describe completamente" ~ 7))

datos <- datos %>% mutate(felicidad2 = case_when(felicidad2 == "No me describe en lo absoluto" ~ 1,
                                                 felicidad2 == "2" ~ 2,
                                                 felicidad2 == "3" ~ 3,
                                                 felicidad2 == "4" ~ 4,
                                                 felicidad2 == "5" ~ 5,
                                                 felicidad2 == "6" ~ 6,
                                                 felicidad2 == "Me describe completamente" ~ 7))

datos <- datos %>% mutate(felicidad3 = case_when(felicidad3 == "No me describe en lo absoluto" ~ 1,
                                                 felicidad3 == "2" ~ 2,
                                                 felicidad3 == "3" ~ 3,
                                                 felicidad3 == "4" ~ 4,
                                                 felicidad3 == "5" ~ 5,
                                                 felicidad3 == "6" ~ 6,
                                                 felicidad3 == "Me describe completamente" ~ 7))

datos <- datos %>% mutate(felicidad4 = case_when(felicidad4 == "No me describe en lo absoluto" ~ 1,
                                                 felicidad4 == "2" ~ 2,
                                                 felicidad4 == "3" ~ 3,
                                                 felicidad4 == "4" ~ 4,
                                                 felicidad4 == "5" ~ 5,
                                                 felicidad4 == "6" ~ 6,
                                                 felicidad4 == "Me describe completamente" ~ 7))

## Crear variable de índice de masa corporal categorizada (1 = Bajo peso, 2 = Normopeso, 3 = Sobrepeso/obesidad)

datos <- datos %>% mutate(IMC_cat = case_when(IMC < 18.5 ~ 1,
                                              IMC >= 18.5 & IMC < 25 ~ 2,
                                              IMC >= 25 ~ 3))

## Transformar la variable de IMC_cat a factor (ordinal) con etiquetas

datos <- datos %>% mutate(IMC_cat = factor(IMC_cat,
                                           levels = c(1, 
                                                      2, 
                                                      3),
                                           labels = c("Bajo peso", 
                                                      "Normopeso", 
                                                      "Sobrepeso/obesidad")))
table(datos$IMC_cat)

# Cálculo de puntajes totales promedio ----

datos <- datos %>% mutate(datos,
                          prom_felicidad = (felicidad1 + felicidad2 + felicidad3 + felicidad4)/4,
                          prom_apoyo = (apoyo1 + apoyo2 + apoyo3 + apoyo4 + apoyo5 + apoyo6)/6,
                          prom_satis = (satisfaccion1 + satisfaccion2 + satisfaccion3 + satisfaccion4 + satisfaccion5)/5)

# Exportar base de datos depurada ----

library(writexl)

write_xlsx(datos, 
           "datos_inicial_filtrada.xlsx")

