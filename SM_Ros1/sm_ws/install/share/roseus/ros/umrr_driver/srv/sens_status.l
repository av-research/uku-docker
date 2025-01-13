;; Auto-generated. Do not edit!


(when (boundp 'umrr_driver::sens_status)
  (if (not (find-package "UMRR_DRIVER"))
    (make-package "UMRR_DRIVER"))
  (shadow 'sens_status (find-package "UMRR_DRIVER")))
(unless (find-package "UMRR_DRIVER::SENS_STATUS")
  (make-package "UMRR_DRIVER::SENS_STATUS"))
(unless (find-package "UMRR_DRIVER::SENS_STATUSREQUEST")
  (make-package "UMRR_DRIVER::SENS_STATUSREQUEST"))
(unless (find-package "UMRR_DRIVER::SENS_STATUSRESPONSE")
  (make-package "UMRR_DRIVER::SENS_STATUSRESPONSE"))

(in-package "ROS")





(defclass umrr_driver::sens_statusRequest
  :super ros::object
  :slots (_section _param _type ))

(defmethod umrr_driver::sens_statusRequest
  (:init
   (&key
    ((:section __section) 0)
    ((:param __param) 0)
    ((:type __type) "")
    )
   (send-super :init)
   (setq _section (round __section))
   (setq _param (round __param))
   (setq _type (string __type))
   self)
  (:section
   (&optional __section)
   (if __section (setq _section __section)) _section)
  (:param
   (&optional __param)
   (if __param (setq _param __param)) _param)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:serialization-length
   ()
   (+
    ;; int32 _section
    4
    ;; int32 _param
    4
    ;; string _type
    4 (length _type)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _section
       (write-long _section s)
     ;; int32 _param
       (write-long _param s)
     ;; string _type
       (write-long (length _type) s) (princ _type s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _section
     (setq _section (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _param
     (setq _param (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _type
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _type (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass umrr_driver::sens_statusResponse
  :super ros::object
  :slots (_resp ))

(defmethod umrr_driver::sens_statusResponse
  (:init
   (&key
    ((:resp __resp) "")
    )
   (send-super :init)
   (setq _resp (string __resp))
   self)
  (:resp
   (&optional __resp)
   (if __resp (setq _resp __resp)) _resp)
  (:serialization-length
   ()
   (+
    ;; string _resp
    4 (length _resp)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _resp
       (write-long (length _resp) s) (princ _resp s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _resp
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _resp (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass umrr_driver::sens_status
  :super ros::object
  :slots ())

(setf (get umrr_driver::sens_status :md5sum-) "93c8fafc2bd33a52659a315b24e02f5f")
(setf (get umrr_driver::sens_status :datatype-) "umrr_driver/sens_status")
(setf (get umrr_driver::sens_status :request) umrr_driver::sens_statusRequest)
(setf (get umrr_driver::sens_status :response) umrr_driver::sens_statusResponse)

(defmethod umrr_driver::sens_statusRequest
  (:response () (instance umrr_driver::sens_statusResponse :init)))

(setf (get umrr_driver::sens_statusRequest :md5sum-) "93c8fafc2bd33a52659a315b24e02f5f")
(setf (get umrr_driver::sens_statusRequest :datatype-) "umrr_driver/sens_statusRequest")
(setf (get umrr_driver::sens_statusRequest :definition-)
      "int32 section
int32 param
string type
---
string resp

")

(setf (get umrr_driver::sens_statusResponse :md5sum-) "93c8fafc2bd33a52659a315b24e02f5f")
(setf (get umrr_driver::sens_statusResponse :datatype-) "umrr_driver/sens_statusResponse")
(setf (get umrr_driver::sens_statusResponse :definition-)
      "int32 section
int32 param
string type
---
string resp

")



(provide :umrr_driver/sens_status "93c8fafc2bd33a52659a315b24e02f5f")


