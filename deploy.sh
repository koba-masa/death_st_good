#!/bin/bash

BASE_DIR=$(cd $(dirname $0); pwd)
cd ${BASE_DIR}

source ~/.bash_profile

git checkout main
git fetch
git pull

bundle config set --local without 'test development'
bundle exec rails db:migrate

SOCKET_DIR=tmp/sockets
if [ ! -d "${SOCKET_DIR}" ]; then
  mkdir -p ${SOCKET_DIR}
fi

bash deploy/systemctl.sh
