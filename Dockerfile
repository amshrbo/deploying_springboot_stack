#Stage 1
# initialize build and set base image for first stage
FROM maven:3.8.4-jdk-11-slim as stage1

# speed up Maven JVM a bit
ENV MAVEN_OPTS="-XX:+TieredCompilation -XX:TieredStopAtLevel=1"

# set working directory
WORKDIR /opt

# copy just pom.xml
COPY pom.xml .

# go-offline using the pom.xml
RUN mvn dependency:go-offline

# copy your other files
COPY ./src ./src

# compile the source code and package it in a jar file
RUN mvn clean install -Dmaven.test.skip=true



####--  Stage 2  --####
# set base image for second stage
FROM openjdk:19-jdk-alpine3.15

# set deployment directory
WORKDIR /opt

# copy over the built artifact from the maven image
COPY --from=stage1 /opt/target/spring-boot-mysql-0.0.1-SNAPSHOT.jar /opt


# Run the app
CMD ["java", "-jar","spring-boot-mysql-0.0.1-SNAPSHOT.jar"]
