FROM eclipse-temurin:21-jdk

WORKDIR /app

COPY target/demo-1.0.jar app.jar

EXPOSE 8081

ENTRYPOINT ["java","-jar","app.jar","--server.port=8081"]
