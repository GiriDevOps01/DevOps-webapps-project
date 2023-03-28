FROM tomcat:latest
MAINTAINER kgiriprasadreddy22@gmail.com
COPY cloudgen-1.war /usr/local/tomcat/webapps
EXPOSE 8080
