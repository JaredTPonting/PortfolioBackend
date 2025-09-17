# Use JDK 21
FROM eclipse-temurin:21-jdk-alpine

WORKDIR /app

# Copy Gradle wrapper and scripts
COPY gradlew .
COPY gradle/ gradle/
COPY build.gradle .
COPY settings.gradle .

# Copy source code
COPY src/ src/

# Make Gradle wrapper executable
RUN chmod +x gradlew

# Build the jar inside container, skipping tests
RUN ./gradlew build -x test

# Copy the jar to a standard name
RUN cp build/libs/portfolioBackend-0.0.1-SNAPSHOT.jar app.jar

# Expose Spring Boot default port
EXPOSE 8080

# Start the app
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
