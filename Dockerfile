FROM jenkins/inbound-agent:latest

USER root

RUN apt-get update &&  apt-get install -y \
    g++ \
    make \
    bash \
    && apt-get clean

USER jenkins