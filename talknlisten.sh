#!/bin/bash
set -euo pipefail

IMAGE_NAME="jazzy-both"

docker build -f Dockerfile.both -t ${IMAGE_NAME} .

docker run \
  -v $(pwd)/cyclonedds.0.xml:/etc/cyclonedds.0.xml:ro \
  -v $(pwd)/cyclonedds.1.xml:/etc/cyclonedds.1.xml:ro \
  -it --rm \
  -p 7410:7410/udp \
  -p 7411:7411/udp \
  -p 7412:7412/udp \
  -p 7413:7413/udp \
  --name both \
  ${IMAGE_NAME}


