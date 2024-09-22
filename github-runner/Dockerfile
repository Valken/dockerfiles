FROM ubuntu:24.04

ARG TARGETARCH
ARG RUNNER_VERSION="2.317.0"
ENV RUNNER_ARCH=${TARGETARCH}

RUN apt-get update -y && apt-get upgrade -y && useradd -m github-runner

RUN apt-get install -y curl jq build-essential libssl-dev libicu-dev python3

WORKDIR /home/github-runner

ADD https://download.docker.com/linux/ubuntu/dists/noble/pool/stable/${TARGETARCH}/docker-ce-cli_27.0.3-1~ubuntu.24.04~noble_arm64.deb .
RUN dpkg -i docker-ce-cli_27.0.3-1~ubuntu.24.04~noble_arm64.deb

# TARGETARCH isn't quite right here. GHA expects x64, not amd64 so here's a little hack!
RUN [ "$RUNNER_ARCH" == "amd64" ] && export RUNNER_ARCH="x64" || true

RUN curl -s -O -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-${RUNNER_ARCH}-${RUNNER_VERSION}.tar.gz && \
    tar xzf ./actions-runner-linux-${RUNNER_ARCH}-${RUNNER_VERSION}.tar.gz

RUN ./bin/installdependencies.sh

COPY entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh

USER github-runner

ENTRYPOINT [ "./entrypoint.sh" ]