#inicia con la imagen base que contiene Java runtime
FROM openjdk:17-jdk-slim as build

# se agregar el jar del microservicio al contenedor
COPY target/com-hotels-services-0.0.1-SNAPSHOT.jar com-hotels-services-0.0.1-SNAPSHOT.jar

#se ejecuta el microservicio
ENTRYPOINT ["java","-jar","/com-hotels-services-0.0.1-SNAPSHOT.jar"]