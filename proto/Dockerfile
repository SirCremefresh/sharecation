FROM ubuntu:20.04

RUN apt-get update  \
    && apt-get install -y \
        apt-transport-https \
        ca-certificates  \
        wget \
        gpg \
    && wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | gpg --dearmor -o /usr/share/keyrings/dart.gpg \
    && echo 'deb [signed-by=/usr/share/keyrings/dart.gpg arch=amd64] https://storage.googleapis.com/download.dartlang.org/linux/debian stable main' | tee /etc/apt/sources.list.d/dart_stable.list \
    && apt-get update
RUN apt-get install -y  \
        dart \
        nodejs




