FROM openhab/openhab:5.1.4

RUN apt update && apt install -y openssh-client
