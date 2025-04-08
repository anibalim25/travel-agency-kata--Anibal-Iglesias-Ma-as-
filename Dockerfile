# Usa una imagen base de Maven con JDK 21
FROM maven:3.8.6-openjdk-21-slim as build

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia el archivo pom.xml y las dependencias para aprovechar el caché de Docker
COPY pom.xml .

# Descarga las dependencias de Maven
RUN mvn dependency:go-offline

# Copia el código fuente al contenedor
COPY src /app/src

# Compila el código dentro del contenedor
RUN mvn clean package -DskipTests

# Usa una imagen base más ligera para la ejecución
FROM eclipse-temurin:21-jdk-alpine

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia el código compilado desde la imagen de build
COPY --from=build /app/target /app

# Expone el puerto que va a utilizar la aplicación
EXPOSE 8080

# Comando para ejecutar la aplicación (ajusta según sea necesario)
CMD ["java", "-cp", "classes:libs/*", "com.breadhardit.TravelAgencyKataApplication"]
