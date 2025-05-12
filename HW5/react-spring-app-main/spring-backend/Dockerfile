FROM maven:3.9-eclipse-temurin-17 AS builder

WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jdk-jammy

RUN useradd -m -s /bin/bash spring
WORKDIR /home/spring/app

COPY --from=builder /app/target/*.jar app.jar
USER spring

ENV JAVA_OPTS=""
ENTRYPOINT exec java $JAVA_OPTS -jar app.jar
