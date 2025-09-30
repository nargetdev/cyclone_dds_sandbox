#!/bin/bash
docker run -v ./cyclonedds.xml:/cyclonedds.xml \
    -e RMW_IMPLEMENTATION=rmw_cyclonedds_cpp  \
    -e CYCLONEDDS_URI=file:///cyclonedds.xml \
    -it --rm --network host \
    jazzy-talker