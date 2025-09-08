FROM openjdk:8-jre-alpine

WORKDIR /app

# Copy JAR from subfolder (adjust path as needed)
COPY build/libs/my-application-1.0.jar /app/my-application-1.0.jar



# Set the JAR as the entrypoint
ENTRYPOINT ["java", "-jar", "my-application-1.0.jar"]
