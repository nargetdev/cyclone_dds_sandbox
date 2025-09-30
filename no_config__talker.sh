#!/bin/bash
docker run \
    -e RMW_IMPLEMENTATION=rmw_cyclonedds_cpp  \
    -e ROS_DOMAIN_ID=2 \
    -it --rm --network host \
    jazzy-talker