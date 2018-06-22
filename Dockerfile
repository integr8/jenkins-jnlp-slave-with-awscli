FROM jenkins/jnlp-slave

USER root

RUN apt-get update && apt-get install -y python-pip python-setuptools --no-install-recommends && pip install awscli \
  && mkdir -p /home/jenkins/.local/bin/ \
  && ln -s /usr/bin/pip /home/jenkins/.local/bin/pip \
  && chown -R jenkins:jenkins /home/jenkins/.local \
  && rm -rf /var/lib/apt/lists/*

USER jenkins
