FROM jenkins:2.3

USER root
RUN curl -sSL https://get.docker.com/ | sh && rm -rf /var/lib/apt/lists/*
RUN usermod -aG docker jenkins

ENV COMPOSE_URL https://api.github.com/repos/docker/compose/releases
RUN curl -sSL $(curl -s ${COMPOSE_URL} | grep browser_download_url | grep $(uname -s)-$(uname -m) | head -n 1 | cut -d '"' -f 4) > /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

USER jenkins
