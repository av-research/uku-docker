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
topic = "/zadar/clusters" + radar_id
context = zmq.Context()
socket = context.socket(zmq.SUB)
socket.connect(ipc_address)
socket.setsockopt_string(zmq.SUBSCRIBE, topic)
print("Done setting socket to path: "+ipc_address+" and topic "+topic)

# Formats
vector_size_format = "=I"
vector_size = struct.calcsize(vector_size_format)
zadar_cluster_info_format = "=ffffffIIBBfffffffI"
zadar_cluster_info_size = struct.calcsize(zadar_cluster_info_format)
zadar_scan_info_format = "=QQB"
zadar_scan_info_size = struct.calcsize(zadar_scan_info_format)
zadar_scan_point_format = "=ffffffffIbbb"
zadar_scan_point_size = struct.calcsize(zadar_scan_point_format)
zadar_scan_header_format = '=IQ'
zadar_scan_header_size = struct.calcsize(zadar_scan_header_format)
zadar_verteces_num = 8
zadar_vertex_format = "=fff"
zadar_vertex_size = struct.calcsize(zadar_vertex_format)

while True:
    try:
        # Receive msg
        message = socket.recv()
        # First part of the message is the topic (string)
        topic_size = len(topic)
        recv_topic = message[:topic_size].decode('utf-8')
        # Create a clusters object 
        clusters = []
        # Prepare msg for parsing
        start = topic_size
        # Get num cluster
        cur_data = message[start:]
        num_clusters = struct.unpack(vector_size_format, cur_data[:vector_size])[0]
        start += vector_size
        # Unpack Zadar Clusters data for each cluster 
        for i in range(num_clusters):
            cur_cluster = {}
            # Deserialize cluster info
            cur_data = message[start:]
            cluster_info = struct.unpack(zadar_cluster_info_format, cur_data[: zadar_cluster_info_size])
            cur_cluster = {
                'x': cluster_info[0],
                'y': cluster_info[1],
                'z': cluster_info[2],
                'doppler': cluster_info[3],
                'snr': cluster_info[4],
                'noise': cluster_info[5],
                'frame_num': cluster_info[6],
                'cluster_id': cluster_info[7],
                'subframe_index': cluster_info[8],
                'is_static': cluster_info[9],
                'd_min': cluster_info[10],
                'd_max': cluster_info[11],
                'r_min': cluster_info[12],
                'r_max': cluster_info[13],
                'lambda1': cluster_info[14],
                'lambda2': cluster_info[15],
                'lambda3': cluster_info[16],
                'num_points': cluster_info[17]
            }
            start += zadar_cluster_info_size
            # Get num vertices
            cur_data = message[start:]
            num_vertices = struct.unpack(vector_size_format, cur_data[:vector_size])[0]
            if (num_vertices != 8):
                print("ERROR num vertices: ",num_vertices," ", 8)
                exit(-1)
            start += vector_size
            # Deserialize cluster vertices
            cur_data = message[start:]
            vertices = []
            for i in range(zadar_verteces_num):
                vertex = struct.unpack(zadar_vertex_format, cur_data[(i*zadar_vertex_size):((i+1)*zadar_vertex_size)])
                vertices.append({
                    'x': vertex[0],
                    'y': vertex[1],
                    'z': vertex[2]
                })
            cur_cluster['vertices'] = vertices
            start += zadar_vertex_size*zadar_verteces_num
            # Get num points
            cur_data = message[start:]
            num_points = struct.unpack(vector_size_format, cur_data[:vector_size])[0]
            if (num_points != cur_cluster['num_points']):
                print("ERROR num points: ",num_points," ", cur_cluster['num_points'])
                exit(-1)
            start += vector_size
            # Deserialize cluster scan
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
            # Deserialize cluster scan info
            cur_data = message[start:]
            width, height, is_dense = struct.unpack(zadar_scan_info_format, cur_data[:zadar_scan_info_size])
            if (width != num_points):
                print("ERROR width: ",width)
                exit(-1)
            scan['width'] = width
            scan['height'] = height
            scan['is_dense'] = is_dense
            start += zadar_scan_info_size
            # Deserialize cluster scan info
            cur_data = message[start:]
            seq, stamp = struct.unpack(zadar_scan_header_format, cur_data[:zadar_scan_header_size])
            scan['header'] = {"seq": seq, "stamp": stamp}
            start += zadar_scan_header_size
            # Append
            cur_cluster['vertices'] = vertices
            cur_cluster['scan'] = scan
            clusters.append(cur_cluster)
        # Log
        print("---- Topic:", recv_topic)
        print("clusters - len:", len(clusters))
        for i, c in enumerate(clusters):
            print(f"cluster {i}, scan points {c['num_points']}")
        # Your application here
        # ...

    except zmq.ZMQError as e:
        print("wait message")
        time.sleep(0.05)