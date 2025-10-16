#!/bin/bash
set -euo pipefail

IMAGE_NAME="jazzy-both"

docker build -f Dockerfile.both -t ${IMAGE_NAME} .

docker run \
  -v $(pwd)/cyclonedds.participant_0.xml:/etc/cyclonedds.participant_0.xml:ro \
  -v $(pwd)/cyclonedds.participant_1.xml:/etc/cyclonedds.participant_1.xml:ro \
  -it --rm \
  -p 7410:7410/udp \
  -p 7411:7411/udp \
  -p 7412:7412/udp \
  -p 7413:7413/udp \
  --name both \
  ${IMAGE_NAME}


