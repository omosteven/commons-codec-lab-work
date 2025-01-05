FROM maven:latest AS builder
WORKDIR /app
COPY pom.xml ./
COPY src ./src
RUN mvn -Drat.skip=true clean package -DskipTests

FROM openjdk:latest
WORKDIR /app

COPY --from=builder /app/target/*.jar ./commons-codec.jar