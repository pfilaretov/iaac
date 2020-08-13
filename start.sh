#!/bin/bash
sudo apt-get -y update
sudo apt-get -y install openjdk-8-jdk
sudo git clone https://github.com/pfilaretov/iaac.git
cd iaac/
sudo chmod 777 mvnw
sudo ./mvnw package -f pom.xml
sudo java -jar target/iaac-1.0.0-SNAPSHOT.jar