FROM ubuntu:22.04

ENV ANSIBLE_VERSION 2.17

RUN apt-get update; \
    apt-get  openssh-client;\
    apt-get install -y gcc python3; \
    apt-get install -y python3-pip; \
    apt-get clean all

RUN pip3 install --upgrade pip; \
    pip3 install "ansible==${ANSIBLE_VERSION}"; \
    pip3 install ansible