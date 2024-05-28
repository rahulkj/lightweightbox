FROM ubuntu:24.04
LABEL maintainer="rahulkj@gmail.com"
LABEL maintainer_name="Rahul Jain"

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

ADD install-cli.sh /

RUN chmod +x ./install-cli.sh \
  && ./install-cli.sh

