#Write a script to create a Docker image from a Dockerfile and tag it with the current timestamp.
FROM node:14
WORKDIR /app
RUN echo "Build started at:$(date)"
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
CMD ["npm","start"]
#Dockerfile for python
FROM python:3.9-slim
WORKDIR /app
COPY requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
EXPOSE 5000
CMD [ "python","app.py"]
#Dockerfile for simple Java application
FROM java:11
WORKDIR /app
COPY . .
RUN javac myapp.java
CMD ["java","myapp"]

#Write a Dockerfile that runs a Java application with environment-specific configurations (Dev, QA, Prod).
FROM java:11
WORKDIR /app
COPY . .
RUN javac myapp.java
ENV ENVIRONMENT=dev
CMD ["java","-Denv=${ENVIRONMENT}","myapp"]
#Write a Dockerfile for deploying a Java application with WildFly (JBoss) as the app server.
FROM jboss/wildfly:latest
WORKDIR /opt/jboss/wildfly
COPY yourapp.war /opt/jboss/wildfly/standalone/deployments/
EXPOSE 8080
#CMD ["bin/standalone.sh","-b","0..0.0.0"]
ENTRYPOINT ["bin/standalone.sh", "-b", "0.0.0.0"]


