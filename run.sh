#!/bin/bash
set -eo pipefail

# Source ROS 2 setup if available
if [ -f "/opt/ros/jazzy/setup.bash" ]; then
    set +u
    . "/opt/ros/jazzy/setup.bash"
    set -u
fi

# Ensure CycloneDDS is used and configured
export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp

# Start listener and talker concurrently
set -m
CYCLONEDDS_URI=file:///etc/cyclonedds.0.xml ros2 run demo_nodes_cpp listener --ros-args -r __node:=container_listener &
LISTENER_PID=$!

CYCLONEDDS_URI=file:///etc/cyclonedds.1.xml ros2 run demo_nodes_cpp talker --ros-args -r __node:=container_talker &
TALKER_PID=$!

# CYCLONEDDS_URI=file:///etc/cyclonedds.0.xml ros2 run demo_nodes_cpp listener &
# LISTENER_PID=$!

# CYCLONEDDS_URI=file:///etc/cyclonedds.1.xml ros2 run demo_nodes_cpp talker &
# TALKER_PID=$!


echo "listener pid: ${LISTENER_PID}"
echo "talker pid: ${TALKER_PID}"

# Forward termination signals to children
term_handler() {
  echo "SIGTERM received, stopping children..."
  kill -TERM ${LISTENER_PID} ${TALKER_PID} 2>/dev/null || true
}
trap term_handler SIGTERM SIGINT

# Wait for children
wait -n ${LISTENER_PID} ${TALKER_PID}

# If one exits, stop the other and exit
kill -TERM ${LISTENER_PID} ${TALKER_PID} 2>/dev/null || true
wait || true


