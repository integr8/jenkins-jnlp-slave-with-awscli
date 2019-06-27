FROM jenkins/jnlp-slave:alpine
LABEL maintainer="Fábio Luciano <fabio@naoimporta.com>"

ARG DOCKER_VERSION='18.09.6'

USER root

RUN apk --no-cache add py2-pip shadow && pip install --upgrade pip && pip install --no-cache-dir --upgrade --user awscli \
  && mkdir -p /home/jenkins/.local/bin/ && ln -s /usr/bin/pip /home/jenkins/.local/bin/pip \
  && wget --quiet https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz -O docker.tgz \ 
  && tar xzvf docker.tgz && mv docker/docker /usr/local/bin \
  && addgroup docker && usermod -aG docker jenkins && rm -r docker docker.tgz  

ENTRYPOINT [ "/usr/local/bin/docker" ]
