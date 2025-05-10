# Tomcat 9 + Java 8 Docker WebApp Deployment

This repository contains a Dockerfile to create a containerized Tomcat 9 environment on Ubuntu with Java 8. It automatically deploys a given `.war` file into the Tomcat `webapps` directory.

## 🔧 Features

- Ubuntu base image
- Java 8 (OpenJDK)
- Apache Tomcat 9.0.100
- WAR file deployment support
- Ready-to-run container with exposed port `8080`

## 🧪 Getting Started

### 1. Clone the repository
docker build -t my-tomcat-app .
docker run -d -p 8080:8080 my-tomcat-app
http://localhost:8080/SampleWebApp

