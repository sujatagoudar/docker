FROM maven:3.8.2-openjdk-8 as build_stage 
WORKDIR /myworkdir
COPY . .
RUN mvn clean package

FROM tomcat:9.0
COPY --from=build_stage /sujata/target/hello-world-war-null.war /usr/local/tomcat/webapps/
