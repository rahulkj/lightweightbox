#!/bin/bash -e

export DEBIAN_FRONTEND=noninteractive

OUTPUT=/usr/local/bin

REPO_CREDHUB=cloudfoundry-incubator/credhub-cli

get_latest_release() {
    DOWNLOAD_URL=$(curl --silent "https://api.github.com/repos/$1/releases/latest" | \
      jq -r \
      --arg flavor $2 '.assets[] | select(.name | contains($flavor)) | .browser_download_url')
}

install_credhub() {
    get_latest_release "$REPO_CREDHUB" "linux"

    wget -qO "$OUTPUT"/credhub.tgz "$DOWNLOAD_URL"
    tar -xf "$OUTPUT"/credhub.tgz
    chmod +x credhub
    mv credhub "$OUTPUT"/credhub

    rm "$OUTPUT"/credhub.tgz

    echo "credhub cli:" $(credhub --version)
}

apt-get update && apt-get install -y --no-install-recommends jq curl wget \
  && apt-get autoremove \
  && wget --no-check-certificate "https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64.tar.gz" -O - | tar xz && mv yq_linux_amd64 /usr/local/bin/yq \
  && wget --no-check-certificate "https://github.com/vmware/govmomi/releases/latest/download/govc_$(uname -s)_$(uname -m).tar.gz" -O - | tar -C /usr/local/bin -xvzf - govc \
  && wget --no-check-certificate "https://dl.min.io/client/mc/release/linux-amd64/mc" && chmod +x mc && mv mc /usr/local/bin \
  && mc -v && govc version && yq -V && jq -V

install_credhub