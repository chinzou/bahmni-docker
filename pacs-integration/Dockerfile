FROM tomcat:8-jre8

COPY ./pacs-integration.war /usr/local/tomcat/webapps/pacs-integration.war

RUN apt update \
&& apt install -y postgresql-client wait-for-it curl iproute2 iputils-ping less nano tree unzip ca-certificates

COPY ./etc/application.properties /usr/local/tomcat/application.properties
COPY ./etc/atomfeed.properties /usr/local/tomcat/pacs-integration/atomfeed.properties
COPY ./etc/atomfeed.properties /atomfeed.properties