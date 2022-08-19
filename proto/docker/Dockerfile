FROM ubuntu:22.04

ARG DART_VERSION="2.16.1"
# renovate: datasource=github-tags depName=nodejs/node versioning=node
ARG NODE_VERSION="16"
# renovate: datasource=github-tags depName=bufbuild/buf
ARG BUF_VERSION="v1.7.0"
# renovate: datasource=npm depName=@protobuf-ts/plugin
ARG PROTOBUF_TS_VERSION="2.8.0"

ENV DART_SDK /usr/lib/dart
ENV PATH $DART_SDK/bin:/root/.pub-cache/bin:$PATH

RUN \
  apt-get -q update  \
    && apt-get install --no-install-recommends -y -q \
        gnupg2  \
        curl  \
        git \
        ca-certificates  \
        unzip  \
        protobuf-compiler  \
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
        nodejs \
    && curl -sSL "https://github.com/bufbuild/buf/releases/download/v${BUF_VERSION}/buf-$(uname -s)-$(uname -m)" -o "/usr/local/bin/buf" \
    && chmod +x "/usr/local/bin/buf"  \
    && npm i -g @protobuf-ts/plugin@${PROTOBUF_TS_VERSION} \
    && apt-get purge --auto-remove -y -q \
        gnupg2  \
        unzip  \
    && apt-get clean  \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp
CMD ["buf", "generate"]
