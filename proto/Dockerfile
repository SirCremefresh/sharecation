FROM ubuntu:20.04

ARG DART_VERSION="2.16.1"
ARG NODE_VERSION="16"

ENV DART_SDK /usr/lib/dart
ENV PATH $DART_SDK/bin:/root/.pub-cache/bin:$PATH

RUN \
  apt-get -q update  \
    && apt-get install --no-install-recommends -y -q \
        gnupg2  \
        curl  \
        git  \
        ca-certificates  \
        unzip  \
        openssh-client  \
    && case "$(uname -m)" in armv7l | armv7) ARCH="arm";; aarch64) ARCH="arm64";; *) ARCH="x64";; esac \
    && echo "Downloading and installing dart sdk version $DART_VERSION for architecture: $ARCH" \
    && curl -O https://storage.googleapis.com/dart-archive/channels/stable/release/$DART_VERSION/sdk/dartsdk-linux-$ARCH-release.zip  \
    && unzip dartsdk-linux-$ARCH-release.zip -d /usr/lib/  \
    && rm dartsdk-linux-$ARCH-release.zip  \
    && mv /usr/lib/dart-sdk /usr/lib/dart \
    && dart pub global activate protoc_plugin \
    && echo "Downloading and installing node version $NODE_VERSION" \
    && curl -sL https://deb.nodesource.com/setup_$NODE_VERSION.x  | bash - \
    && apt-get install --no-install-recommends -y -q \
        nodejs


