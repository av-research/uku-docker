#!/usr/bin/env python

import rospy
from std_msgs.msg import Header
from radar_msgs.msg import RadarDetection
from geometry_msgs.msg import Point, Vector3
from sensor_msgs.msg import PointCloud2, PointField
import struct

def republish_callback(input_msg):
    republished_msg = RadarDetection()
    republished_msg.header = input_msg.header
    republished_msg.detections = []

    # Parse input data and create RadarDetection messages
    for i in range(0, len(input_msg.data), 48):
        detection = RadarDetection()
        detection.detection_id = struct.unpack_from('<H', input_msg.data, i+36)[0]
        
        position = Point()
        position.x, position.y, position.z = struct.unpack_from('<ddd', input_msg.data, i)
        detection.position = position

        velocity = Vector3()
        velocity.x, velocity.y, velocity.z = 0, 0, 0

        detection.amplitude = 0

        republished_msg.detections.append(detection)

    pub.publish(republished_msg)

if __name__ == '__main__':
    rospy.init_node('republish_node', anonymous=True)
    rospy.Subscriber('zadar/scan0', PointCloud2, republish_callback)
    pub = rospy.Publisher('/radar_converter/detections', RadarDetection, queue_size=10)
    rospy.spin()
