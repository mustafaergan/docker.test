#define base docker image
From openjdk:17
LABEL maintainer="mustafaergan"
ADD target/docker.test-0.0.1-SNAPSHOT.jar docker-demo.jar
ENTRYPOINT ["java","-jar","docker-demo.jar"]