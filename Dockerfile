# Maven 
FROM maven:3-jdk-11 as builder
#ADD . /app
COPY . /opt/
RUn ls -al
WORKDIR /opt/restapi

RUN mvn clean -e -B package

# RTSDK Java
FROM openjdk:11-jdk as builder
LABEL maintainer="danielfr1987@gmail.com"
WORKDIR /opt/restapi
COPY --from=builder /opt/restapi/target/restapi-0.0.1-SNAPSHOT.jar .
ENTRYPOINT ["java","-jar","restapi-0.0.1-SNAPSHOT.jar"]
