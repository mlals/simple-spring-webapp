FROM 		    tomcat:8.0.21-jre8
MAINTAINER 	BFS BI CoE
COPY 		    ./target/projectName.war /usr/local/tomcat/webapps/
