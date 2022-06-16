#Jenkins Docker 

# Intro

Working through [SDP Learning Labs](https://boozallen.github.io/sdp-docs/learning-labs/1/index.html)

## Usage

Needed to specify an extra param to get Jenkins to understand it's running in a container. Also using a volume for `jenkins_home` to persist my config

```
docker run --name jenkins \
   -v jenkins_home:/var/jenkins_home \
   -v /var/run/docker.sock:/var/run/docker.sock \
   --privileged \
   --user root \
   --cgroupns host \
   -p 50000:50000 \
   -p 8080:8080 \
   -d \
   jenkins:lts-docker
```
