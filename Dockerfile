FROM ubuntu
ARG NVM_VERSION=NVM_VERSION
ARG DOCKER_CLIENT_VERSION=DOCKER_CLIENT_VERSION
RUN mkdir /usr/app
WORKDIR /usr/app
RUN apt-get update && \
    apt-get install curl unzip -y && \
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/$NVM_VERSION/install.sh | bash
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \ 
    unzip awscliv2.zip && \
    ./aws/install
RUN curl -s -O https://download.docker.com/linux/static/stable/x86_64/$DOCKER_CLIENT_VERSION && \
    tar --extract --file=$DOCKER_CLIENT_VERSION
ENV PATH "./docker:$PATH"