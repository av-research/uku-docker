#!/bin/bash

source /opt/ros/noetic/setup.bash 
cd catkin_ws/
source install/setup.bash 
source install/local_setup.bash 
source devel/setup.bash 

roslaunch zadar_ros_launch zadar_run_driver.launch "$@"
