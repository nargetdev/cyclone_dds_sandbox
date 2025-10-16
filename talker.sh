#!/bin/bash
docker run -v $(pwd)/cyclonedds.participant_1.xml:/cyclonedds.xml \
    -e RMW_IMPLEMENTATION=rmw_cyclonedds_cpp  \
    -e CYCLONEDDS_URI=file:///cyclonedds.xml \
    -it --rm \
    -p 7412:7412/udp \
    -p 7413:7413/udp \
    --name talker \
    jazzy-talker ros2 run demo_nodes_cpp talker --ros-args -r __node:=mac_talker