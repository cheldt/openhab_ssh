FROM openhab/openhab:latest

RUN apt update && apt install -y openssh-client
