#!/bin/bash
docker run -v $(pwd)/cyclonedds.0.xml:/etc/cyclonedds.xml:ro \
    -e RMW_IMPLEMENTATION=rmw_cyclonedds_cpp  \
    -e CYCLONEDDS_URI=file:///etc/cyclonedds.xml \
    -it --rm \
    -p 7410:7410/udp \
    -p 7411:7411/udp \
    --name listener \
    jazzy-talker ros2 run demo_nodes_cpp listener --ros-args -r __node:=mac_listener