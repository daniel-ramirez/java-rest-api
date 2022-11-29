# Maven 
FROM maven
RUN mkdir /app
WORKDIR /app
COPY . /app
RUN mvn clean -e -B package

# RTSDK Java
FROM openjdk:11-jdk as builder
LABEL maintainer="danielfr1987@gmail.com"
WORKDIR /opt/restapi
COPY --from=0 /app/target/restapi-0.0.1-SNAPSHOT.jar .
ENTRYPOINT ["java","-jar","restapi-0.0.1-SNAPSHOT.jar"]
