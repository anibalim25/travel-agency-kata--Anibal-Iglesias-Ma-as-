# Etapa 1: Construcción de la aplicación con Maven
FROM maven:3.9-eclipse-temurin-21-alpine AS build

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia el archivo pom.xml (para manejar las dependencias de Maven)
COPY pom.xml .

# Descarga las dependencias de Maven
RUN mvn dependency:go-offline

# Copia el código fuente al contenedor
COPY src /app/src

# Compila y empaqueta la aplicación
RUN mvn clean package -DskipTests

# Etapa 2: Ejecutar la aplicación con una imagen más ligera (alpine)
FROM eclipse-temurin:21-jre-alpine

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia el archivo JAR generado desde la etapa de construcción
COPY --from=build /app/target/travel-agency-kata-0.0.1-SNAPSHOT.jar /app/travel-agency-kata-0.0.1-SNAPSHOT.jar

# Expone el puerto en el que la aplicación estará corriendo
EXPOSE 8080

# Comando para ejecutar el JAR dentro del contenedor
CMD ["java", "-jar", "travel-agency-kata-0.0.1-SNAPSHOT.jar"]
