FROM adoptopenjdk/openjdk11:alpine-jre
LABEL maintainer="danielfr1987@gmail.com"
WORKDIR /myapp
RUN mvnw package
COPY target/restapi-0.0.1-SNAPSHOT.jar /myapp/my-app.jar
ENTRYPOINT ["java","-jar","my-app.jar"]
