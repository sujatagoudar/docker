FROM maven:3.8.2-openjdk-8 as build
ARG BUILD_VERSION=1.0.5
WORKDIR /myworkdir
COPY . .
RUN mvn clean package

FROM tomcat:9.0
ARG BUILD_VERSION=1.0.5
COPY --from=build_stage /myworkdir/target/hello-world-war-${BUILD_VERSION}.war /usr/local/tomcat/webapps/
