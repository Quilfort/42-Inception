FROM node:latest

#Create directory in container image for app code
RUN mkdir /usr/src/app

#Copy app code (./my-app) to /usr/src/app/ in container image
COPY ./my-app /usr/src/app/

#Set working directory
WORKDIR /usr/src/app

#Install dependencies from packages.json
RUN npm install

#Set container listen port
EXPOSE 3000

#Command for container to execute
ENTRYPOINT [ "npm" , "start" ]