cmake_minimum_required(VERSION 3.0.2)
project(zadar_ros_launch)
add_definitions(-std=c++17)
set (CMAKE_CXX_STANDARD 17)

set(${PROJECT_NAME}_CATKIN_DEPS
  roscpp
)

find_package(catkin REQUIRED COMPONENTS 
  ${${PROJECT_NAME}_CATKIN_DEPS} 
  roscpp
)

include_directories(include ${catkin_INCLUDE_DIRS})

catkin_package()

# install(
#   DIRECTORY driver/
#   DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}/driver
# )

