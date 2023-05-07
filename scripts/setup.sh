#!/bin/bash

set -ev

ROOT_REPOSITORY=`pwd`

mkdir -p models
wget -nc https://datarelease.blob.core.windows.net/grit/models/grit_b_densecap_objectdet.pth -P models

# docker build -f Dockerfile.base . -t grit
docker build -f Dockerfile . -t grit 

set +v
echo "You can run the following command:"
echo "    $ docker container run --gpus all -it -e OPENAI_API_KEY=\$OPENAI_API_KEY -v ${ROOT_REPOSITORY}:/app --rm grit:latest"
