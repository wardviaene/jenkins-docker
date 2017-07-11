FROM jenkins

USER root

# RUN mkdir -p /tmp/download && \
#  curl -L https://get.docker.com/builds/Linux/x86_64/docker-1.13.1.tgz | tar -xz -C /tmp/download && \
#  rm -rf /tmp/download/docker/dockerd && \
#  mv /tmp/download/docker/docker* /usr/local/bin/ && \
#  rm -rf /tmp/download

# RUN groupadd docker
# RUN usermod -a -G staff,docker jenkins

RUN apt-get -qq update \
   && apt-get -qq -y install \
   curl

RUN curl -sSL https://get.docker.com/ | sh

RUN usermod -a -G staff,docker jenkins

USER jenkins
