FROM debian:stable-slim

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
  && rm -rf /var/lib/apt/lists/*  

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.9.2/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl

RUN groupadd -r kubectl && useradd -u 1000 --no-log-init -m -r -g kubectl kubectl
WORKDIR /home/kubectl

COPY entrypoint.sh .
RUN chmod +x entrypoint.sh && chown kubectl:kubectl entrypoint.sh

USER kubectl
