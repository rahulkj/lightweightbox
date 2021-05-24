FROM ubuntu:21.04
LABEL maintainer="rahulkj@gmail.com"
LABEL maintainer_name="Rahul Jain"

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

RUN apt-get update && apt-get install -y --no-install-recommends jq curl wget \
  && apt-get autoremove \
  && wget --no-check-certificate https://github.com/mikefarah/yq/releases/download/v4.9.3/yq_linux_amd64.tar.gz -O - | tar xz && mv yq_linux_amd64 /usr/bin/yq

