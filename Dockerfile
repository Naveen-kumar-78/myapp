# Use Ubuntu as the base image
FROM ubuntu:latest

# Set environment variables
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV PATH=$JAVA_HOME/bin:$PATH
ENV CATALINA_HOME=/Application/samplewebsite
ENV PATH=$CATALINA_HOME/bin:$PATH

# Install dependencies and Java 8
RUN apt update -y && apt install -y wget openjdk-8-jdk unzip

# Create application directory structure
RUN mkdir -p /Application/samplewebsite

# Download and install Tomcat 9.0.100 in /Application/Bijlipraband
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.100/bin/apache-tomcat-9.0.100.tar.gz -O /tmp/tomcat.tar.gz \
    && tar xzf /tmp/tomcat.tar.gz -C /Application/samplewebsite --strip-components=1 \
    && rm /tmp/tomcat.tar.gz

# Expose Tomcat default port
EXPOSE 8080

# Copy your WAR file from a specific location on your host machine
# Example: If your WAR file is in `/home/naveen/builds/app.war`, update the COPY command accordingly.
COPY SampleWebApp.war /Application/samplewebsite/webapps/

# Set execution permission for startup script
RUN chmod +x /Application/samplewebsite/bin/startup.sh

# Start Tomcat using startup.sh
CMD ["/Application/samplewebsite/bin/catalina.sh", "run"]
