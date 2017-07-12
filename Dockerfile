FROM jenkins

USER root

RUN apt-get update

RUN mkdir -p /tmp/download && \
 curl -L https://get.docker.com/builds/Linux/x86_64/docker-17.05.0-ce.tgz | tar -xz -C /tmp/download && \
 rm -rf /tmp/download/docker/dockerd && \
 mv /tmp/download/docker/docker* /usr/local/bin/ && \
 rm -rf /tmp/download

RUN groupadd docker
RUN usermod -a -G staff,docker jenkins

RUN apt-get install -y rsync

# RUN apt-get -qq update \
#    && apt-get -qq -y install \
#    curl

# RUN curl -sSL https://get.docker.com/ | sh

# RUN usermod -a -G staff,docker jenkins

USER jenkins
