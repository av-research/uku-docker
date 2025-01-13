;; Auto-generated. Do not edit!


(when (boundp 'umrr_driver::sens_param_req)
  (if (not (find-package "UMRR_DRIVER"))
    (make-package "UMRR_DRIVER"))
  (shadow 'sens_param_req (find-package "UMRR_DRIVER")))
(unless (find-package "UMRR_DRIVER::SENS_PARAM_REQ")
  (make-package "UMRR_DRIVER::SENS_PARAM_REQ"))
(unless (find-package "UMRR_DRIVER::SENS_PARAM_REQREQUEST")
  (make-package "UMRR_DRIVER::SENS_PARAM_REQREQUEST"))
(unless (find-package "UMRR_DRIVER::SENS_PARAM_REQRESPONSE")
  (make-package "UMRR_DRIVER::SENS_PARAM_REQRESPONSE"))

(in-package "ROS")





(defclass umrr_driver::sens_param_reqRequest
  :super ros::object
  :slots (_section _param ))

(defmethod umrr_driver::sens_param_reqRequest
  (:init
   (&key
    ((:section __section) 0)
    ((:param __param) 0)
    )
   (send-super :init)
   (setq _section (round __section))
   (setq _param (round __param))
   self)
  (:section
   (&optional __section)
   (if __section (setq _section __section)) _section)
  (:param
   (&optional __param)
   (if __param (setq _param __param)) _param)
  (:serialization-length
   ()
   (+
    ;; int32 _section
    4
    ;; int32 _param
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
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _section
     (setq _section (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _param
     (setq _param (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass umrr_driver::sens_param_reqResponse
  :super ros::object
  :slots (_resp ))

(defmethod umrr_driver::sens_param_reqResponse
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

(defclass umrr_driver::sens_param_req
  :super ros::object
  :slots ())

(setf (get umrr_driver::sens_param_req :md5sum-) "9a0eeee29694f2ca329fbb723ef7be91")
(setf (get umrr_driver::sens_param_req :datatype-) "umrr_driver/sens_param_req")
(setf (get umrr_driver::sens_param_req :request) umrr_driver::sens_param_reqRequest)
(setf (get umrr_driver::sens_param_req :response) umrr_driver::sens_param_reqResponse)

(defmethod umrr_driver::sens_param_reqRequest
  (:response () (instance umrr_driver::sens_param_reqResponse :init)))

(setf (get umrr_driver::sens_param_reqRequest :md5sum-) "9a0eeee29694f2ca329fbb723ef7be91")
(setf (get umrr_driver::sens_param_reqRequest :datatype-) "umrr_driver/sens_param_reqRequest")
(setf (get umrr_driver::sens_param_reqRequest :definition-)
      "int32 section
int32 param
---
string resp

")

(setf (get umrr_driver::sens_param_reqResponse :md5sum-) "9a0eeee29694f2ca329fbb723ef7be91")
(setf (get umrr_driver::sens_param_reqResponse :datatype-) "umrr_driver/sens_param_reqResponse")
(setf (get umrr_driver::sens_param_reqResponse :definition-)
      "int32 section
int32 param
---
string resp

")



(provide :umrr_driver/sens_param_req "9a0eeee29694f2ca329fbb723ef7be91")


