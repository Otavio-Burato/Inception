FROM debian:oldstable

RUN apt -y update && apt -y install nodejs npm

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

COPY ./conf/package*.json .

RUN npm install

RUN mkdir -p /usr/src/app/public
COPY ./src/public/* /usr/src/app/public/
RUN mkdir -p /usr/src/app/src
COPY ./src/code/* /usr/src/app/src/

EXPOSE 3000

ENTRYPOINT [ "npm", "run", "dev" ]
