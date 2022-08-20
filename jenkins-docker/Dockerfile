FROM jenkins/jenkins:latest
ARG TARGETPLATFORM
ARG BUILDPLATFORM
USER root
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add
RUN echo $TARGETPLATFORM $TARGETPLATFORM
RUN add-apt-repository \
   "deb [arch=$(dpkg --print-architecture) ] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
RUN apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io
EXPOSE 8080
