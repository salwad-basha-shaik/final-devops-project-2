FROM docker.io/library/ubuntu:18.04
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install openjdk-8-jdk wget
RUN mkdir /usr/local/tomcat
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.105/bin/apache-tomcat-9.0.105.tar.gz  /tmp/apache-tomcat-9.0.105.tar.gz
RUN cd /tmp &&  tar xvfz apache-tomcat-9.0.105.tar.gz
RUN cp -Rv /tmp/apache-tomcat-9.0.105/* /usr/local/tomcat/
ADD **/*.war /usr/local/tomcat/webapps
LABEL org.opencontainers.image.source https://github.com/salwad-basha-shaik/final-devops-project-2
EXPOSE 8080
CMD /usr/local/tomcat/bin/catalina.sh run
