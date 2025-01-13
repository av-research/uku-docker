#!/bin/bash

source /opt/ros/noetic/setup.bash
cp /code/usb_cam-test.launch /opt/ros/noetic/share/usb_cam/launch/
cd sm_ws && source devel/setup.bash
roscore
