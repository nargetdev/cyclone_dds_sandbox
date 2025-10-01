#!/bin/bash
docker run -v $(pwd)/cyclonedds.xml:/cyclonedds.xml \
    -e RMW_IMPLEMENTATION=rmw_cyclonedds_cpp  \
    -e CYCLONEDDS_URI=file:///cyclonedds.xml \
    -it --rm \
    --name talkerportfree \
    jazzy-talker ros2 run demo_nodes_cpp talker --ros-args -r __node:=mac_talker