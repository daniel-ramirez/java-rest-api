# Maven 
FROM maven:3.8.1-openjdk-11-slim AS builder
WORKDIR /app

COPY pom.xml .
RUN mvn -e -B dependency:resolve
COPY src ./src
RUN mvn clean -e -B package

# RTSDK Java
FROM adoptopenjdk/openjdk11:alpine-jre
LABEL maintainer="danielfr1987@gmail.com"
WORKDIR /app
COPY --from=builder /app/target/restapi-0.0.1-SNAPSHOT.jar .
ENTRYPOINT ["java","-jar","restapi-0.0.1-SNAPSHOT.jar"]
