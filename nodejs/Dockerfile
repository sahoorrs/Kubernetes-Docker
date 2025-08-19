FROM node:latest

ENV MONGO_DB_USERNAME=admin
ENV MONGO_DB_PASSWORD=admin123

RUN apt-get update && apt-get install -y curl
RUN apt-get install -y nodejs 
RUN npm install -g pm2
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY . .

CMD [ "node", "server.js" ]
