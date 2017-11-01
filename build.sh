# Docker Environment provisioning - steps
#!/bin/bash

#Step 1 : Create the code  build and check in to repository 
#       : Command below is to get the checked in code from Git
echo "Pull the latest application code from git repository"
git clone https://github.com/mlals/spring-webapp-template.git
#		: Maven build scripts are used to build the application binaires
echo "Build application binaries"
cd spring-webapp-template
/Users/mohanlals/Applications/apache-maven-3.3.3/bin/mvn install
#Step1	: Outcome => Build binary (webapp.war file)

#Step 2	: Orchestration Definition (Shell scripts)

#Step 3 : Create and Provision a new Virtualbox
echo "Create a new  Virtual Machine......... ()"
MACHINE_NAME='bfsbicoe1'
docker-machine create --driver virtualbox $MACHINE_NAME
eval "$(docker-machine env $MACHINE_NAME)"

#		: Build docker image contains (Tomcat 8, Jre8, application war)
echo "Create a docker container image with application platform and package"
docker build -t mohanlalmca/tomcat:latest .
#Step 3 : 	Outcome => docker image stored in docker repository

#Step 4 :	Deploy the application image to local
echo "Provision docker image into virtualbox"
docker run -p 8080:8080 -d --name tomcat mohanlalmca/tomcat:latest
#Step 4 :	Outcome => The application is deployed successfully on local virtual machine
