FROM openjdk:8

RUN apt-get update && apt-get install -y maven
COPY . /dpb_project
RUN  cd /dpb_project && mvn package

#run the spring boot application
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom", "-jar","/dpb_project/target/dbp-0.0.1-SNAPSHOT.jar"]