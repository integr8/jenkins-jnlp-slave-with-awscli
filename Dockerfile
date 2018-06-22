FROM jenkins/jnlp-slave

USER root

RUN apt-get update && apt-get install -y python-pip python-setuptools --no-install-recommends && pip install awscli \
  && mkdir -p /home/jenkins/.local/bin/ \
  && ln -s /usr/bin/pip /home/jenkins/.local/bin/pip \
  && chown -R jenkins:jenkins /home/jenkins/.local \
  && rm -rf /var/lib/apt/lists/*

RUN curl -s https://download.docker.com/linux/static/test/x86_64/docker-18.05.0-ce.tgz > docker-18.05.0-ce.tgz \
  && tar xzvf docker-18.05.0-ce.tgz \    
  && mv docker/docker /usr/local/bin \   
  && rm -r docker docker-18.05.0-ce.tgz

USER jenkins
