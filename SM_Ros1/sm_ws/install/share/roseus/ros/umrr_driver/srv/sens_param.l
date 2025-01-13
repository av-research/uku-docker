;; Auto-generated. Do not edit!


(when (boundp 'umrr_driver::sens_param)
  (if (not (find-package "UMRR_DRIVER"))
    (make-package "UMRR_DRIVER"))
  (shadow 'sens_param (find-package "UMRR_DRIVER")))
(unless (find-package "UMRR_DRIVER::SENS_PARAM")
  (make-package "UMRR_DRIVER::SENS_PARAM"))
(unless (find-package "UMRR_DRIVER::SENS_PARAMREQUEST")
  (make-package "UMRR_DRIVER::SENS_PARAMREQUEST"))
(unless (find-package "UMRR_DRIVER::SENS_PARAMRESPONSE")
  (make-package "UMRR_DRIVER::SENS_PARAMRESPONSE"))

(in-package "ROS")





(defclass umrr_driver::sens_paramRequest
  :super ros::object
  :slots (_section _param _value _dim ))

(defmethod umrr_driver::sens_paramRequest
  (:init
   (&key
    ((:section __section) 0)
    ((:param __param) 0)
    ((:value __value) 0)
    ((:dim __dim) 0)
    )
   (send-super :init)
   (setq _section (round __section))
   (setq _param (round __param))
   (setq _value (round __value))
   (setq _dim (round __dim))
   self)
  (:section
   (&optional __section)
   (if __section (setq _section __section)) _section)
  (:param
   (&optional __param)
   (if __param (setq _param __param)) _param)
  (:value
   (&optional __value)
   (if __value (setq _value __value)) _value)
  (:dim
   (&optional __dim)
   (if __dim (setq _dim __dim)) _dim)
  (:serialization-length
   ()
   (+
    ;; int32 _section
    4
    ;; int32 _param
    4
    ;; int32 _value
    4
    ;; int32 _dim
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _section
       (write-long _section s)
     ;; int32 _param
       (write-long _param s)
     ;; int32 _value
       (write-long _value s)
     ;; int32 _dim
       (write-long _dim s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _section
     (setq _section (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _param
     (setq _param (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _value
     (setq _value (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _dim
     (setq _dim (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass umrr_driver::sens_paramResponse
  :super ros::object
  :slots (_resp ))

(defmethod umrr_driver::sens_paramResponse
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

(defclass umrr_driver::sens_param
  :super ros::object
  :slots ())

(setf (get umrr_driver::sens_param :md5sum-) "d082684b67b68ff067addfa1087d79e3")
(setf (get umrr_driver::sens_param :datatype-) "umrr_driver/sens_param")
(setf (get umrr_driver::sens_param :request) umrr_driver::sens_paramRequest)
(setf (get umrr_driver::sens_param :response) umrr_driver::sens_paramResponse)

(defmethod umrr_driver::sens_paramRequest
  (:response () (instance umrr_driver::sens_paramResponse :init)))

(setf (get umrr_driver::sens_paramRequest :md5sum-) "d082684b67b68ff067addfa1087d79e3")
(setf (get umrr_driver::sens_paramRequest :datatype-) "umrr_driver/sens_paramRequest")
(setf (get umrr_driver::sens_paramRequest :definition-)
      "int32 section
int32 param
int32 value
int32 dim
---
string resp

")

(setf (get umrr_driver::sens_paramResponse :md5sum-) "d082684b67b68ff067addfa1087d79e3")
(setf (get umrr_driver::sens_paramResponse :datatype-) "umrr_driver/sens_paramResponse")
(setf (get umrr_driver::sens_paramResponse :definition-)
      "int32 section
int32 param
int32 value
int32 dim
---
string resp

")



(provide :umrr_driver/sens_param "d082684b67b68ff067addfa1087d79e3")


