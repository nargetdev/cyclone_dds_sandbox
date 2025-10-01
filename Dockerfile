FROM arm64v8/ros:jazzy

# Update package list and install demo nodes
RUN apt update && apt install -y ros-jazzy-demo-nodes-cpp

RUN apt-get install -y ros-jazzy-rmw-cyclonedds-cpp

# for debug..
RUN apt install net-tools iputils-ping -y

# Set the default command to run the demo node
# Note: You'll need to specify which demo node to run
# Common options include: talker, listener, add_two_ints_server, add_two_ints_client
CMD ["ros2", "run", "demo_nodes_cpp", "talker"]
