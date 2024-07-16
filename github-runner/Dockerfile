FROM ubuntu:24.04

ARG TARGETARCH
ARG RUNNER_VERSION="2.317.0"
ENV RUNNER_ARCH=${TARGETARCH}

RUN apt-get update -y && apt-get upgrade -y && useradd -m github-runner

RUN apt-get install -y curl jq build-essential libssl-dev libicu-dev

WORKDIR /home/github-runner

# TARGETARCH isn't quite right here. GHA expects x64, not amd64. Fix later, building for ARM64 only for now.
RUN curl -s -O -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-${TARGETARCH}-${RUNNER_VERSION}.tar.gz && \
    tar xzf ./actions-runner-linux-${TARGETARCH}-${RUNNER_VERSION}.tar.gz

RUN ./bin/installdependencies.sh

COPY entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh

USER github-runner

ENTRYPOINT [ "./entrypoint.sh" ]



