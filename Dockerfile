# Maven 
FROM maven:3-jdk-11
RUN mkdir /app
WORKDIR /app
COPY . /app
RUN mvn clean package

# RTSDK Java
FROM openjdk:11-jdk
LABEL maintainer="danielfr1987@gmail.com"
WORKDIR /opt/restapi
COPY --from=0 /app/target/restapi-0.0.1-SNAPSHOT.jar .
ENTRYPOINT ["java","-jar","restapi-0.0.1-SNAPSHOT.jar"]
