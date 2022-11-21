FROM openjdk:18-jdk-alpine AS anaconda
ADD spring-petclinic.tar .
WORKDIR spring-petclinic
RUN ./mvnw package -DskipTests=true

FROM openjdk:18-jdk-alpine
COPY --from=anaconda /spring-petclinic/target/spring-petclinic-2.7.3.jar /
CMD ["java", "-jar", "/spring-petclinic-2.7.3.jar"]
