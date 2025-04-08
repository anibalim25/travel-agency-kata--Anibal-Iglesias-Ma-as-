
FROM maven:3.9-eclipse-temurin-21-alpine AS build

WORKDIR /app

COPY pom.xml .

RUN mvn dependency:go-offline

COPY src /app/src

RUN mvn clean package -DskipTests

FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

COPY --from=build /app/target/travel-agency-kata-0.0.1-SNAPSHOT.jar /app/travel-agency-kata-0.0.1-SNAPSHOT.jar

EXPOSE 8080

CMD ["java", "-jar", "travel-agency-kata-0.0.1-SNAPSHOT.jar"]
