# Maven 
FROM maven:3-jdk-11
#ADD . /app
WORKDIR /opt/app

COPY pom.xml .
RUN mvn -e -B dependency:resolve
COPY src ./src
RUN mvn clean -e -B package

# RTSDK Java
FROM openjdk:11-jdk
LABEL maintainer="danielfr1987@gmail.com"
WORKDIR /app
COPY --from=0 /opt/app/target/restapi-0.0.1-SNAPSHOT.jar .
ENTRYPOINT ["java","-jar","restapi-0.0.1-SNAPSHOT.jar"]
