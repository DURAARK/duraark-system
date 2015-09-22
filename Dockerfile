FROM ubuntu:14.04

# Install system dependencies
RUN DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -qqy git software-properties-common build-essential cmake vim libboost-program-options1.55-dev libeigen3-dev apt-transport-https ca-certificates curl iptables && apt-get install --fix-missing
RUN add-apt-repository ppa:chris-lea/node.js -y && apt-get update -y && apt-get -y install nodejs -y && npm install -g grunt-cli sails nodemon

RUN curl -sSL https://get.docker.com/ubuntu/ | sh
RUN curl -L https://github.com/docker/compose/releases/download/1.4.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose

COPY ./docker-compose.yml /duraark-system/docker-compose.yml
COPY ./scripts/deploy-duraark.sh /duraark-system/deploy-duraark.sh
COPY ./scripts/wrapdocker /usr/local/bin/wrapdocker

RUN chmod +x /usr/local/bin/wrapdocker /usr/local/bin/docker-compose /duraark-system/deploy-duraark.sh

WORKDIR /duraark-system

EXPOSE 80

VOLUME /var/lib/docker

CMD ["wrapdocker"]
