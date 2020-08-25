#!/bin/bash
sudo yum update -y
# "...-devel" means JDK, not JRE only
sudo yum install -y java-1.8.0-openjdk-devel
sudo yum install -y git

git clone https://github.com/pfilaretov/iaac.git
cd iaac
chmod +x mvnw
./mvnw package -f pom.xml
java -jar target/iaac-1.0.0-SNAPSHOT.jar
