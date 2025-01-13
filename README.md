#Docker Compose

first build the docker images
```bash
docker compose up --build ${service}
#or
docker compose build
```

To run the various services, you first must do two very important things:
```bash
#Set up the CAN bus
sudo ip link set can0 up type can bitrate 500000 dbitrate 2000000 fd on fd-non-iso on
#Add docker to xhost
xhost +local:docker
```

basically i think the order of operations should be:  
```bash
docker compose up -d master_ros1  
docker compose up smartmicro_ros1  
docker compose up zadar  
docker exec -it master_ros1 bash  
```

Nodes to launch in the master_ros1 container:  
```bash
source sm_ws/devel/setup.bash
roslaunch transforms transforms.launch  
roslaunch xsens_mti_driver xsens_mti_node.launch  
roslaunch velodyne_pointcloud VLP16_points.launch  
roslaunch usb_cam usb_cam-test.launch  
```
You can launch rviz for sanity checks and record rosbags with 'rosbag record -a'

The zadar labs ros driver seems to be a bit annoying, it sometimes has trouble finding the sensor on the CAN bus.  

I have gotten around this by first running the driver as a standalone from bash and then running the ros node.  
```bash
./zadar_setup.sh
#This will find the zadar labs sensor and subsequently fail due to the driver's insistence on having access to xcb or wayland
docker compose up zadar
#As the zadar driver runs in ROS1, it is necessary to run a bridge if you want to talk to a ROS2 node.  This should be run afer the zadar node is up.
docker compose up ros2_bridge
```

If you run 'docker compose up ${service}' the process defined in the Dockerfile/dockercompose entrypoint will run in the terminal.  
If you run 'docker compose up -d ${service}' it will run as detached in the background, and you should run 'docker compose down' when you no longer need it.
