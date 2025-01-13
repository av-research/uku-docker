#!/bin/bash

source /opt/ros/noetic/setup.bash
cd sm_ws && source devel/setup.bash
roslaunch umrr_driver automotive_radar_default.launch
