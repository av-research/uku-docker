#!/usr/bin/env python

import rospy
from sensor_msgs.msg import Image, CameraInfo

class ImageInfoRepublisher:
    def __init__(self):
        rospy.init_node('image_republisher', anonymous=True)
        self.image_pub = rospy.Publisher('/sensors/camera/image_color', Image, queue_size=10)      
        self.camera_info_pub = rospy.Publisher('/sensors/camera/camera_info', CameraInfo, queue_size=10)
        rospy.Subscriber('/usb_cam/image_raw', Image, self.image_callback)
        rospy.Subscriber('/usb_cam/camera_info', CameraInfo, self.camera_info_callback)
    
    def image_callback(self, data):
        # Republish the received image
        self.image_pub.publish(data)
        
    def camera_info_callback(self, data):
        # Republish the received camera info
        self.camera_info_pub.publish(data)

if __name__ == '__main__':
    try:
        republisher = ImageInfoRepublisher()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass
