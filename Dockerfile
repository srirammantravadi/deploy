FROM openjdk:8-jdk-alpine

RUN apk add --no-cache curl tar bash procps unzip

EXPOSE 8081 443

RUN mkdir -p /mnt/coderepo/ 

COPY . /mnt/coderepo/

RUN unzip -oj -d $JAVA_HOME/jre/lib/security /mnt/coderepo/jce_policy-8.zip \*/\*.jar \
  && rm /mnt/coderepo/jce_policy-8.zip 
#&& unzip -oj -d $JAVA_HOME/jre/lib /mnt/coderepo/mariadb-java-client-2.7.2-sources.jar.zip

WORKDIR /mnt/coderepo

ENTRYPOINT ["java", "-jar", "/mnt/coderepo/demo-0.0.1-SNAPSHOT.jar"]
