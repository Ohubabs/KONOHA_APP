FROM tomcat:8.0.20-jre8
### Good stuff
COPY target/*.war /usr/local/tomcat/webapp/tesla.war

#COPY target/*.war /usr/local/tomcat/webapps/tesla.war

#if prefix isn't taken out use target/*.war
