FROM jenkins/jenkins:lts

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends

RUN wget https://packages.microsoft.com/config/ubuntu/19.10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb \
    && dpkg -i packages-microsoft-prod.deb

RUN apt-get update \ 
    && apt-get install apt-transport-https sudo -y \
    && apt-get update \
    && apt-get install dotnet-sdk-3.1 -y

RUN echo "jenkins:jenkins" | chpasswd && adduser jenkins sudo

USER jenkins