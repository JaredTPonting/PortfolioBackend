FROM eclipse-temurin:21-jdk-alpine

WORKDIR /app

# Copy Gradle wrapper and build files
COPY gradlew .
COPY gradle/ gradle/
COPY build.gradle .
COPY settings.gradle .

# Copy source code
COPY src/ src/

# Make wrapper executable
RUN chmod +x gradlew

# Build project inside Docker
RUN ./gradlew build -x test

# Copy the generated jar from build/libs
COPY build/libs/portfolioBackend-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/app.jar"]
