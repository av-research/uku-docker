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
topic = "/zadar/tracks" + radar_id
context = zmq.Context()
socket = context.socket(zmq.SUB)
socket.connect(ipc_address)
socket.setsockopt_string(zmq.SUBSCRIBE, topic)
print("Done setting socket to path: "+ipc_address+" and topic "+topic)

# Formats
vector_size_format = "=I"
vector_size = struct.calcsize(vector_size_format)
zadar_track_info_format = "=QfffffffffffQQQQQ"
zadar_track_info_size = struct.calcsize(zadar_track_info_format)
zadar_scan_info_format = "=QQB"
zadar_scan_info_size = struct.calcsize(zadar_scan_info_format)
zadar_scan_point_format = "=ffffffffIbbb"
zadar_scan_point_size = struct.calcsize(zadar_scan_point_format)
zadar_scan_header_format = '=IQ'
zadar_scan_header_size = struct.calcsize(zadar_scan_header_format)

while True:
    try:
        # Receive msg
        message = socket.recv()
        # First part of the message is the topic (string)
        topic_size = len(topic)
        recv_topic = message[:topic_size].decode('utf-8')
        # Create a tracks object 
        tracks = []
        # Prepare msg for parsing
        start = topic_size
        # Get num track
        cur_data = message[start:]
        num_tracks = struct.unpack(vector_size_format, cur_data[:vector_size])[0]
        start += vector_size
        # Unpack Zadar Tracks data for each track 
        for i in range(num_tracks):
            cur_track = {}
            # Deserialize track info
            cur_data = message[start:]
            track_info = struct.unpack(zadar_track_info_format, cur_data[: zadar_track_info_size])
            cur_track = {
                'track_id': track_info[0],
                'x': track_info[1],
                'y': track_info[2],
                'z': track_info[3],
                'vx': track_info[4],
                'vy': track_info[5],
                'vz': track_info[6],
                'ax': track_info[7],
                'ay': track_info[8],
                'az': track_info[9],
                'yaw': track_info[10],
                'speed': track_info[11],
                'num_points': track_info[12],
                'latest_observed_frame_num': track_info[13],
                'latest_cluster_id': track_info[14],
                'classification_output': track_info[15],
                'state': track_info[16]
            }
            start += zadar_track_info_size
            # Get num points
            cur_data = message[start:]
            num_points = struct.unpack(vector_size_format, cur_data[:vector_size])[0]
            if (num_points != cur_track['num_points']):
                print("ERROR num points: ",num_points," ", cur_track['num_points'])
                exit(-1)
            start += vector_size
            # Deserialize track scan
            cur_data = message[start:]
            scan = {'points':[]}
            for i in range(num_points):
                point = struct.unpack(zadar_scan_point_format, cur_data[(i*zadar_scan_point_size):((i+1)*zadar_scan_point_size)])
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
            start += num_points*zadar_scan_point_size
            # Deserialize track scan info
            cur_data = message[start:]
            width, height, is_dense = struct.unpack(zadar_scan_info_format, cur_data[:zadar_scan_info_size])
            if (width != num_points):
                print("ERROR width: ",width)
                exit(-1)
            scan['width'] = width
            scan['height'] = height
            scan['is_dense'] = is_dense
            start += zadar_scan_info_size
            # Deserialize track scan info
            cur_data = message[start:]
            seq, stamp = struct.unpack(zadar_scan_header_format, cur_data[:zadar_scan_header_size])
            scan['header'] = {"seq": seq, "stamp": stamp}
            start += zadar_scan_header_size
            # Append
            cur_track['scan'] = scan
            tracks.append(cur_track)
        # Log
        print("---- Topic:", recv_topic)
        print("track - len:", len(tracks))
        for i, c in enumerate(tracks):
            print(f"track {i}, scan points {c['num_points']}")
        # Your application here
        # ...

    except zmq.ZMQError as e:
        print("wait message")
        time.sleep(0.05)