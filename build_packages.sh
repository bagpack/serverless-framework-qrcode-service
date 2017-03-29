#!/bin/bash

set -x

SERVICE=qrcode-service
PACKAGE_DIR=vendor

if [ ! -e $PACKAGE_DIR ]; then
  mkdir -p $PACKAGE_DIR
fi

cp requirements.txt $PACKAGE_DIR
docker build . -t $SERVICE
docker run -v "$(pwd)"/$PACKAGE_DIR:/work $SERVICE pip install -r requirements.txt -t .
