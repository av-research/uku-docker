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

# Construct the socket base path
ipc_address = "ipc://" + root_dir + "/" + socket_file + radar_id + ".ipc"
topic = "/zadar/scan" + radar_id
context = zmq.Context()
socket = context.socket(zmq.SUB)
socket.connect(ipc_address)
socket.setsockopt_string(zmq.SUBSCRIBE, topic)
print("Done setting socket to path: "+ipc_address+" and topic "+topic)

# Formats
radar_point_format = "=ffffffffIbbb"
radar_point_size = struct.calcsize(radar_point_format)
radar_scan_header_format = "=LQ256sQQ?"
header_size = struct.calcsize(radar_scan_header_format)

while True:
    try:
        # Receive msg
        message = socket.recv()
        # First part of the message is the topic (string)
        topic_size = len(topic) 
        recv_topic = message[:topic_size].decode('utf-8')
        # Deserialize the header
        header_data = message[topic_size:topic_size + header_size]
        header_seq, header_stamp, header_frame_id, header_width, header_height, header_is_dense = struct.unpack(radar_scan_header_format, header_data)
        scan = {
            'header': {
                'seq': header_seq,
                'stamp': header_stamp,
                'frame_id': header_frame_id.decode('utf-8').rstrip('\0')  # Remove null terminators
            }
        }
        # Assuming the rest of the message is serialized RadarPoint data
        point_count = (len(message) - (topic_size + struct.calcsize(radar_scan_header_format))) // radar_point_size
        point_data_size = len(message) - topic_size - header_size
        point_count = point_data_size // struct.calcsize(radar_point_format)
        points_data = message[topic_size + header_size:]
        scan['points'] = []
        # Unpack RadarPoint data for each point in the scan
        for i in range(point_count):
            point_data = points_data[i * radar_point_size:(i + 1) * radar_point_size]
            point = struct.unpack(radar_point_format, point_data)
            scan['points'].append({
                'x': point[0],
                'y': point[1],
                'z': point[2],
                'snr': point[3],
                'range': point[4],
                'noise': point[5],
                'doppler': point[6],
                'adjusted_doppler': point[7],
                'frame_num': point[8],
                'is_static': point[9],
                'removed': point[10]
            })
        scan['width'] = header_width
        scan['height'] = header_height  
        scan['is_dense'] = header_is_dense 
        # Log
        print("---- Topic:", recv_topic)
        print("Header - Seq:", scan['header']['seq'])
        print("Header - Stamp:", scan['header']['stamp'])
        print("Header - Frame ID:", scan['header']['frame_id'])
        print("Header - Width:", scan['width'])
        print("Header - Height:", scan['height'])
        print("Header - Is Dense:", scan['is_dense'])
        # Your application here
        # ...

    except zmq.ZMQError as e:
        print("wait message")
        time.sleep(0.005)


