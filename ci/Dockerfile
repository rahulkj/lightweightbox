FROM ubuntu:21.04
LABEL maintainer="rahulkj@gmail.com"
LABEL maintainer_name="Rahul Jain"

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

RUN apt-get update && apt-get install -y --no-install-recommends jq curl wget \
  && apt-get autoremove \
  && wget --no-check-certificate https://github.com/mikefarah/yq/releases/download/latest/yq_linux_amd64.tar.gz -O - | tar xz && mv yq_linux_amd64 /usr/local/bin/yq \
  && wget --no-check-certificate "https://github.com/vmware/govmomi/releases/latest/download/govc_$(uname -s)_$(uname -m).tar.gz" -O - | tar -C /usr/local/bin -xvzf - govc \
  && wget https://dl.min.io/server/minio/release/linux-amd64/mc && chmod +x mc && mv mc /usr/local/bin \
  && mc -v && govc version && && yq -V jq -V

