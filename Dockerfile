FROM openhab/openhab:latest

RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get install -y openssh-client \
 && rm -rf /var/lib/apt/lists/*
