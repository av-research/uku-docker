import sys
import zmq
import struct
import time
from pathlib import Path

# Define params
cur_path = Path.cwd()
root_dir = str(cur_path)
socket_file = "zadar_data_radar"
radar_id = "0"

# Initialize the socket
ipc_address = "ipc://" + root_dir + "/" + socket_file + radar_id + ".ipc"
topic = "/zadar/odometry" + radar_id
context = zmq.Context()
socket = context.socket(zmq.SUB)
socket.connect(ipc_address)
socket.setsockopt_string(zmq.SUBSCRIBE, topic)
print("Done setting socket to path: "+ipc_address+" and topic "+topic)

# Formats
zadar_odometry_info_format = "=ffffffffffff"
zadar_odometry_info_size = struct.calcsize(zadar_odometry_info_format)

while True:
    try:
        # Receive msg
        message = socket.recv()
        # First part of the message is the topic (string)
        topic_size = len(topic)
        recv_topic = message[:topic_size].decode('utf-8')
        # Deserialize odometry info
        odometry_info = struct.unpack(zadar_odometry_info_format, message[topic_size: ])
        odometry = {
            'vx': odometry_info[0],
            'vy': odometry_info[1],
            'omega': odometry_info[2],
            'phi': odometry_info[3],
            'psi': odometry_info[4],
            'theta': odometry_info[5],
            'raw_vx': odometry_info[6],
            'raw_vy': odometry_info[7],
            'raw_omega': odometry_info[8],
            'device_vx': odometry_info[9],
            'device_vy': odometry_info[10],
            'device_vz': odometry_info[11]
        }
        # Log
        print("---- Topic:", recv_topic)
        print("odometry: ", odometry)
        # Your application here
        # ...

    except zmq.ZMQError as e:
        print("wait message")
        time.sleep(0.05)