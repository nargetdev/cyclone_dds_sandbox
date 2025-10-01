#!/bin/bash
docker run -v $(pwd)/cyclonedds.xml:/cyclonedds.xml \
    -e RMW_IMPLEMENTATION=rmw_cyclonedds_cpp  \
    -e CYCLONEDDS_URI=file:///cyclonedds.xml \
    -it --rm \
    -p 7410:7410/udp \
    --name talker \
    jazzy-talker ros2 run demo_nodes_cpp talker --ros-args -r __node:=mac_talker