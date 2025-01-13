# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "accumulator: 1 messages, 3 services")

set(MSG_I_FLAGS "-Iaccumulator:/code/sm_ws/src/multi_sensor_calibration/accumulator/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(accumulator_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/code/sm_ws/src/multi_sensor_calibration/accumulator/msg/AccumulatedPatterns.msg" NAME_WE)
add_custom_target(_accumulator_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "accumulator" "/code/sm_ws/src/multi_sensor_calibration/accumulator/msg/AccumulatedPatterns.msg" "std_msgs/Header:sensor_msgs/PointField:sensor_msgs/PointCloud2:std_msgs/String"
)

get_filename_component(_filename "/code/sm_ws/src/multi_sensor_calibration/accumulator/srv/SendPatterns.srv" NAME_WE)
add_custom_target(_accumulator_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "accumulator" "/code/sm_ws/src/multi_sensor_calibration/accumulator/srv/SendPatterns.srv" "std_msgs/String:accumulator/AccumulatedPatterns:sensor_msgs/PointField:sensor_msgs/PointCloud2:std_msgs/Header"
)

get_filename_component(_filename "/code/sm_ws/src/multi_sensor_calibration/accumulator/srv/SendString.srv" NAME_WE)
add_custom_target(_accumulator_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "accumulator" "/code/sm_ws/src/multi_sensor_calibration/accumulator/srv/SendString.srv" "std_msgs/String"
)

get_filename_component(_filename "/code/sm_ws/src/multi_sensor_calibration/accumulator/srv/SendUInt.srv" NAME_WE)
add_custom_target(_accumulator_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "accumulator" "/code/sm_ws/src/multi_sensor_calibration/accumulator/srv/SendUInt.srv" "std_msgs/UInt16"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(accumulator
  "/code/sm_ws/src/multi_sensor_calibration/accumulator/msg/AccumulatedPatterns.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/accumulator
)

### Generating Services
_generate_srv_cpp(accumulator
  "/code/sm_ws/src/multi_sensor_calibration/accumulator/srv/SendPatterns.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg;/code/sm_ws/src/multi_sensor_calibration/accumulator/msg/AccumulatedPatterns.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/accumulator
)
_generate_srv_cpp(accumulator
  "/code/sm_ws/src/multi_sensor_calibration/accumulator/srv/SendString.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/accumulator
)
_generate_srv_cpp(accumulator
  "/code/sm_ws/src/multi_sensor_calibration/accumulator/srv/SendUInt.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/UInt16.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/accumulator
)

### Generating Module File
_generate_module_cpp(accumulator
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/accumulator
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(accumulator_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(accumulator_generate_messages accumulator_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/code/sm_ws/src/multi_sensor_calibration/accumulator/msg/AccumulatedPatterns.msg" NAME_WE)
add_dependencies(accumulator_generate_messages_cpp _accumulator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/code/sm_ws/src/multi_sensor_calibration/accumulator/srv/SendPatterns.srv" NAME_WE)
add_dependencies(accumulator_generate_messages_cpp _accumulator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/code/sm_ws/src/multi_sensor_calibration/accumulator/srv/SendString.srv" NAME_WE)
add_dependencies(accumulator_generate_messages_cpp _accumulator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/code/sm_ws/src/multi_sensor_calibration/accumulator/srv/SendUInt.srv" NAME_WE)
add_dependencies(accumulator_generate_messages_cpp _accumulator_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(accumulator_gencpp)
add_dependencies(accumulator_gencpp accumulator_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS accumulator_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(accumulator
  "/code/sm_ws/src/multi_sensor_calibration/accumulator/msg/AccumulatedPatterns.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/accumulator
)

### Generating Services
_generate_srv_eus(accumulator
  "/code/sm_ws/src/multi_sensor_calibration/accumulator/srv/SendPatterns.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg;/code/sm_ws/src/multi_sensor_calibration/accumulator/msg/AccumulatedPatterns.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/accumulator
)
_generate_srv_eus(accumulator
  "/code/sm_ws/src/multi_sensor_calibration/accumulator/srv/SendString.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/accumulator
)
_generate_srv_eus(accumulator
  "/code/sm_ws/src/multi_sensor_calibration/accumulator/srv/SendUInt.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/UInt16.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/accumulator
)

### Generating Module File
_generate_module_eus(accumulator
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/accumulator
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(accumulator_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(accumulator_generate_messages accumulator_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/code/sm_ws/src/multi_sensor_calibration/accumulator/msg/AccumulatedPatterns.msg" NAME_WE)
add_dependencies(accumulator_generate_messages_eus _accumulator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/code/sm_ws/src/multi_sensor_calibration/accumulator/srv/SendPatterns.srv" NAME_WE)
add_dependencies(accumulator_generate_messages_eus _accumulator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/code/sm_ws/src/multi_sensor_calibration/accumulator/srv/SendString.srv" NAME_WE)
add_dependencies(accumulator_generate_messages_eus _accumulator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/code/sm_ws/src/multi_sensor_calibration/accumulator/srv/SendUInt.srv" NAME_WE)
add_dependencies(accumulator_generate_messages_eus _accumulator_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(accumulator_geneus)
add_dependencies(accumulator_geneus accumulator_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS accumulator_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(accumulator
  "/code/sm_ws/src/multi_sensor_calibration/accumulator/msg/AccumulatedPatterns.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/accumulator
)

### Generating Services
_generate_srv_lisp(accumulator
  "/code/sm_ws/src/multi_sensor_calibration/accumulator/srv/SendPatterns.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg;/code/sm_ws/src/multi_sensor_calibration/accumulator/msg/AccumulatedPatterns.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/accumulator
)
_generate_srv_lisp(accumulator
  "/code/sm_ws/src/multi_sensor_calibration/accumulator/srv/SendString.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/accumulator
)
_generate_srv_lisp(accumulator
  "/code/sm_ws/src/multi_sensor_calibration/accumulator/srv/SendUInt.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/UInt16.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/accumulator
)

### Generating Module File
_generate_module_lisp(accumulator
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/accumulator
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(accumulator_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(accumulator_generate_messages accumulator_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/code/sm_ws/src/multi_sensor_calibration/accumulator/msg/AccumulatedPatterns.msg" NAME_WE)
add_dependencies(accumulator_generate_messages_lisp _accumulator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/code/sm_ws/src/multi_sensor_calibration/accumulator/srv/SendPatterns.srv" NAME_WE)
add_dependencies(accumulator_generate_messages_lisp _accumulator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/code/sm_ws/src/multi_sensor_calibration/accumulator/srv/SendString.srv" NAME_WE)
add_dependencies(accumulator_generate_messages_lisp _accumulator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/code/sm_ws/src/multi_sensor_calibration/accumulator/srv/SendUInt.srv" NAME_WE)
add_dependencies(accumulator_generate_messages_lisp _accumulator_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(accumulator_genlisp)
add_dependencies(accumulator_genlisp accumulator_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS accumulator_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(accumulator
  "/code/sm_ws/src/multi_sensor_calibration/accumulator/msg/AccumulatedPatterns.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/accumulator
)

### Generating Services
_generate_srv_nodejs(accumulator
  "/code/sm_ws/src/multi_sensor_calibration/accumulator/srv/SendPatterns.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg;/code/sm_ws/src/multi_sensor_calibration/accumulator/msg/AccumulatedPatterns.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/accumulator
)
_generate_srv_nodejs(accumulator
  "/code/sm_ws/src/multi_sensor_calibration/accumulator/srv/SendString.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/accumulator
)
_generate_srv_nodejs(accumulator
  "/code/sm_ws/src/multi_sensor_calibration/accumulator/srv/SendUInt.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/UInt16.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/accumulator
)

### Generating Module File
_generate_module_nodejs(accumulator
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/accumulator
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(accumulator_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(accumulator_generate_messages accumulator_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/code/sm_ws/src/multi_sensor_calibration/accumulator/msg/AccumulatedPatterns.msg" NAME_WE)
add_dependencies(accumulator_generate_messages_nodejs _accumulator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/code/sm_ws/src/multi_sensor_calibration/accumulator/srv/SendPatterns.srv" NAME_WE)
add_dependencies(accumulator_generate_messages_nodejs _accumulator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/code/sm_ws/src/multi_sensor_calibration/accumulator/srv/SendString.srv" NAME_WE)
add_dependencies(accumulator_generate_messages_nodejs _accumulator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/code/sm_ws/src/multi_sensor_calibration/accumulator/srv/SendUInt.srv" NAME_WE)
add_dependencies(accumulator_generate_messages_nodejs _accumulator_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(accumulator_gennodejs)
add_dependencies(accumulator_gennodejs accumulator_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS accumulator_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(accumulator
  "/code/sm_ws/src/multi_sensor_calibration/accumulator/msg/AccumulatedPatterns.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/accumulator
)

### Generating Services
_generate_srv_py(accumulator
  "/code/sm_ws/src/multi_sensor_calibration/accumulator/srv/SendPatterns.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg;/code/sm_ws/src/multi_sensor_calibration/accumulator/msg/AccumulatedPatterns.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/accumulator
)
_generate_srv_py(accumulator
  "/code/sm_ws/src/multi_sensor_calibration/accumulator/srv/SendString.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/accumulator
)
_generate_srv_py(accumulator
  "/code/sm_ws/src/multi_sensor_calibration/accumulator/srv/SendUInt.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/UInt16.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/accumulator
)

### Generating Module File
_generate_module_py(accumulator
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/accumulator
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(accumulator_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(accumulator_generate_messages accumulator_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/code/sm_ws/src/multi_sensor_calibration/accumulator/msg/AccumulatedPatterns.msg" NAME_WE)
add_dependencies(accumulator_generate_messages_py _accumulator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/code/sm_ws/src/multi_sensor_calibration/accumulator/srv/SendPatterns.srv" NAME_WE)
add_dependencies(accumulator_generate_messages_py _accumulator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/code/sm_ws/src/multi_sensor_calibration/accumulator/srv/SendString.srv" NAME_WE)
add_dependencies(accumulator_generate_messages_py _accumulator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/code/sm_ws/src/multi_sensor_calibration/accumulator/srv/SendUInt.srv" NAME_WE)
add_dependencies(accumulator_generate_messages_py _accumulator_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(accumulator_genpy)
add_dependencies(accumulator_genpy accumulator_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS accumulator_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/accumulator)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/accumulator
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(accumulator_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(accumulator_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/accumulator)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/accumulator
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(accumulator_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(accumulator_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/accumulator)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/accumulator
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(accumulator_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(accumulator_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/accumulator)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/accumulator
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(accumulator_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(accumulator_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/accumulator)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/accumulator\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/accumulator
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(accumulator_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(accumulator_generate_messages_py sensor_msgs_generate_messages_py)
endif()
