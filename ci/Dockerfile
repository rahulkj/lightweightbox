ARG IMAGE=ubuntu:24.10
FROM ${IMAGE}

ARG MAINTAINER="rahulkj@gmail.com"
LABEL maintainer="rahulkj@gmail.com"

ARG MAINTAINER_NAME="Rahul Jain"
LABEL maintainer_name="Rahul Jain"

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

ADD install-cli.sh /

RUN chmod +x ./install-cli.sh \
  && ./install-cli.sh

