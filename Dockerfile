FROM debian:stable-slim

ARG ver
ENV VERSION=$ver

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    gettext-base \
  && rm -rf /var/lib/apt/lists/*  

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v$VERSION/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl

RUN mkdir ~/.kube
COPY kubectl /usr/local/bin/kubectl
RUN chmod +x /usr/local/bin/kubectl
