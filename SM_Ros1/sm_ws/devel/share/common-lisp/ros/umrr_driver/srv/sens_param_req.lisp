; Auto-generated. Do not edit!


(cl:in-package umrr_driver-srv)


;//! \htmlinclude sens_param_req-request.msg.html

(cl:defclass <sens_param_req-request> (roslisp-msg-protocol:ros-message)
  ((section
    :reader section
    :initarg :section
    :type cl:integer
    :initform 0)
   (param
    :reader param
    :initarg :param
    :type cl:integer
    :initform 0))
)

(cl:defclass sens_param_req-request (<sens_param_req-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <sens_param_req-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'sens_param_req-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name umrr_driver-srv:<sens_param_req-request> is deprecated: use umrr_driver-srv:sens_param_req-request instead.")))

(cl:ensure-generic-function 'section-val :lambda-list '(m))
(cl:defmethod section-val ((m <sens_param_req-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader umrr_driver-srv:section-val is deprecated.  Use umrr_driver-srv:section instead.")
  (section m))

(cl:ensure-generic-function 'param-val :lambda-list '(m))
(cl:defmethod param-val ((m <sens_param_req-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader umrr_driver-srv:param-val is deprecated.  Use umrr_driver-srv:param instead.")
  (param m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <sens_param_req-request>) ostream)
  "Serializes a message object of type '<sens_param_req-request>"
  (cl:let* ((signed (cl:slot-value msg 'section)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'param)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <sens_param_req-request>) istream)
  "Deserializes a message object of type '<sens_param_req-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'section) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'param) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<sens_param_req-request>)))
  "Returns string type for a service object of type '<sens_param_req-request>"
  "umrr_driver/sens_param_reqRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'sens_param_req-request)))
  "Returns string type for a service object of type 'sens_param_req-request"
  "umrr_driver/sens_param_reqRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<sens_param_req-request>)))
  "Returns md5sum for a message object of type '<sens_param_req-request>"
  "9a0eeee29694f2ca329fbb723ef7be91")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'sens_param_req-request)))
  "Returns md5sum for a message object of type 'sens_param_req-request"
  "9a0eeee29694f2ca329fbb723ef7be91")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<sens_param_req-request>)))
  "Returns full string definition for message of type '<sens_param_req-request>"
  (cl:format cl:nil "int32 section~%int32 param~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'sens_param_req-request)))
  "Returns full string definition for message of type 'sens_param_req-request"
  (cl:format cl:nil "int32 section~%int32 param~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <sens_param_req-request>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <sens_param_req-request>))
  "Converts a ROS message object to a list"
  (cl:list 'sens_param_req-request
    (cl:cons ':section (section msg))
    (cl:cons ':param (param msg))
))
;//! \htmlinclude sens_param_req-response.msg.html

(cl:defclass <sens_param_req-response> (roslisp-msg-protocol:ros-message)
  ((resp
    :reader resp
    :initarg :resp
    :type cl:string
    :initform ""))
)

(cl:defclass sens_param_req-response (<sens_param_req-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <sens_param_req-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'sens_param_req-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name umrr_driver-srv:<sens_param_req-response> is deprecated: use umrr_driver-srv:sens_param_req-response instead.")))

(cl:ensure-generic-function 'resp-val :lambda-list '(m))
(cl:defmethod resp-val ((m <sens_param_req-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader umrr_driver-srv:resp-val is deprecated.  Use umrr_driver-srv:resp instead.")
  (resp m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <sens_param_req-response>) ostream)
  "Serializes a message object of type '<sens_param_req-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'resp))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'resp))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <sens_param_req-response>) istream)
  "Deserializes a message object of type '<sens_param_req-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'resp) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'resp) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<sens_param_req-response>)))
  "Returns string type for a service object of type '<sens_param_req-response>"
  "umrr_driver/sens_param_reqResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'sens_param_req-response)))
  "Returns string type for a service object of type 'sens_param_req-response"
  "umrr_driver/sens_param_reqResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<sens_param_req-response>)))
  "Returns md5sum for a message object of type '<sens_param_req-response>"
  "9a0eeee29694f2ca329fbb723ef7be91")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'sens_param_req-response)))
  "Returns md5sum for a message object of type 'sens_param_req-response"
  "9a0eeee29694f2ca329fbb723ef7be91")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<sens_param_req-response>)))
  "Returns full string definition for message of type '<sens_param_req-response>"
  (cl:format cl:nil "string resp~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'sens_param_req-response)))
  "Returns full string definition for message of type 'sens_param_req-response"
  (cl:format cl:nil "string resp~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <sens_param_req-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'resp))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <sens_param_req-response>))
  "Converts a ROS message object to a list"
  (cl:list 'sens_param_req-response
    (cl:cons ':resp (resp msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'sens_param_req)))
  'sens_param_req-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'sens_param_req)))
  'sens_param_req-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'sens_param_req)))
  "Returns string type for a service object of type '<sens_param_req>"
  "umrr_driver/sens_param_req")