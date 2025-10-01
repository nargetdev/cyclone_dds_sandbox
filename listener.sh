#!/bin/bash
docker run -v $(pwd)/cyclonedds.xml:/etc/cyclonedds.xml:ro \
    -e RMW_IMPLEMENTATION=rmw_cyclonedds_cpp  \
    -e CYCLONEDDS_URI=file:///etc/cyclonedds.xml \
    -it --rm \
    -p 7400:7400/udp \
    -p 7410:7410/udp \
    -p 7411:7411/udp \
    -p 7412:7412/udp \
    -p 7413:7413/udp \
    -p 7414:7414/udp \
    -p 7415:7415/udp \
    -p 7416:7416/udp \
    -p 7417:7417/udp \
    -p 7418:7418/udp \
    -p 7419:7419/udp \
    -p 7420:7420/udp \
    jazzy-talker ros2 run demo_nodes_cpp listener --ros-args -r __node:=mac_listener