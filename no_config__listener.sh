#!/bin/bash
docker run \
    -e RMW_IMPLEMENTATION=rmw_cyclonedds_cpp  \
    -e ROS_DOMAIN_ID=2 \
    -e CYCLONEDDS_URI='<CycloneDDS><Domain id="2"><General><Interfaces><NetworkInterface name="eth0"/></Interfaces></General></Domain></CycloneDDS>' \
    -it --rm --network host \
    jazzy-talker ros2 run demo_nodes_cpp listener