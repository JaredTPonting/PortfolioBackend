# Base image with JDK 21
FROM eclipse-temurin:21-jdk-alpine

WORKDIR /app

# Copy Gradle wrapper and build scripts
COPY gradlew .
COPY gradle/ gradle/
COPY build.gradle .
COPY settings.gradle .

# Copy source code
COPY src/ src/

# Make Gradle wrapper executable
RUN chmod +x gradlew

# Build project inside container, skipping tests
RUN ./gradlew build -x test
RUN ls -l build/libs/

# Copy any jar produced in build/libs/ to app.jar
RUN cp build/libs/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app/app.jar"]
