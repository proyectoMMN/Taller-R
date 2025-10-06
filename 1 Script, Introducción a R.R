
# ¿Cómo funciona R?

# En R, los objetos se definen con el operador de asignación “<-”.

suma <- 2 + 2 

suma

# El siguiente código asigna diferentes números a los objetos a y b, y luego 
# asigna la correlación de Pearson entre ambos conjuntos de números a 
# un nuevo objeto llamado asociación.

a <- c(1, 53, 69, 20, 67, 32, 75, 83)

b <- c(2, 43, 89, 30, 50, 18, 89, 60)

asociacion <- cor.test(x = a, 
                       y = b)

asociacion

# Los objetos también se pueden actualizar. 
# Para agregar un nuevo número al objeto a simplemente se añade dentro de la secuencia (96).

a <- c(1, 53, 69, 20, 67, 32, 75, 83, 96)

a

# Los objetos se manipulan usando funciones que transforman datos de entrada (input) en una salida (output).

median(a)

median(b)

# Función c()

# Los números 28, 18, 25, 42, 54 y 33 por sí solos no representan un conjunto dentro de R, 
# sin embargo, esto se puede establecer usando c().

c(28, 18, 25, 42, 54, 33)

# Automáticamente R devuelve los números que están en el conjunto.

# Sin embargo, esto no ocurre cuando el resultado de la función se asigna a un objeto.

a <- c(28, 18, 25, 42, 54, 33)

# En este caso, es necesario escribir el nombre del objeto para obtener su contenido.

a

# Función cor.test()

a <- c(1, 53, 69, 20, 67, 32, 75, 83)

b <- c(2, 43, 89, 30, 50, 18, 89, 60)

asociacion <- cor.test(x = a, 
                       y = b)

asociacion

cor.test(x = a, 
         y = b, 
         method = "spearman")

# No será recordado en tareas posteriores dentro de R

c(1, 53, 69, 20, 67, 32, 75, 83)

# El conjunto será almacenado y podrá ser utilizado posteriormente

conjunto_num <- c(1, 53, 69, 20, 67, 32, 75, 83)

# Suma 100 a cada número del objeto "conjunto_num"

conjunto_num + 100

# Histograma

hist(conjunto_num)










