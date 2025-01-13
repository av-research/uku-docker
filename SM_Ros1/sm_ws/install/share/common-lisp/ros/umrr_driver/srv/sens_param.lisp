; Auto-generated. Do not edit!


(cl:in-package umrr_driver-srv)


;//! \htmlinclude sens_param-request.msg.html

(cl:defclass <sens_param-request> (roslisp-msg-protocol:ros-message)
  ((section
    :reader section
    :initarg :section
    :type cl:integer
    :initform 0)
   (param
    :reader param
    :initarg :param
    :type cl:integer
    :initform 0)
   (value
    :reader value
    :initarg :value
    :type cl:integer
    :initform 0)
   (dim
    :reader dim
    :initarg :dim
    :type cl:integer
    :initform 0))
)

(cl:defclass sens_param-request (<sens_param-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <sens_param-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'sens_param-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name umrr_driver-srv:<sens_param-request> is deprecated: use umrr_driver-srv:sens_param-request instead.")))

(cl:ensure-generic-function 'section-val :lambda-list '(m))
(cl:defmethod section-val ((m <sens_param-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader umrr_driver-srv:section-val is deprecated.  Use umrr_driver-srv:section instead.")
  (section m))

(cl:ensure-generic-function 'param-val :lambda-list '(m))
(cl:defmethod param-val ((m <sens_param-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader umrr_driver-srv:param-val is deprecated.  Use umrr_driver-srv:param instead.")
  (param m))

(cl:ensure-generic-function 'value-val :lambda-list '(m))
(cl:defmethod value-val ((m <sens_param-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader umrr_driver-srv:value-val is deprecated.  Use umrr_driver-srv:value instead.")
  (value m))

(cl:ensure-generic-function 'dim-val :lambda-list '(m))
(cl:defmethod dim-val ((m <sens_param-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader umrr_driver-srv:dim-val is deprecated.  Use umrr_driver-srv:dim instead.")
  (dim m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <sens_param-request>) ostream)
  "Serializes a message object of type '<sens_param-request>"
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
  (cl:let* ((signed (cl:slot-value msg 'value)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'dim)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <sens_param-request>) istream)
  "Deserializes a message object of type '<sens_param-request>"
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
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'value) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'dim) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<sens_param-request>)))
  "Returns string type for a service object of type '<sens_param-request>"
  "umrr_driver/sens_paramRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'sens_param-request)))
  "Returns string type for a service object of type 'sens_param-request"
  "umrr_driver/sens_paramRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<sens_param-request>)))
  "Returns md5sum for a message object of type '<sens_param-request>"
  "d082684b67b68ff067addfa1087d79e3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'sens_param-request)))
  "Returns md5sum for a message object of type 'sens_param-request"
  "d082684b67b68ff067addfa1087d79e3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<sens_param-request>)))
  "Returns full string definition for message of type '<sens_param-request>"
  (cl:format cl:nil "int32 section~%int32 param~%int32 value~%int32 dim~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'sens_param-request)))
  "Returns full string definition for message of type 'sens_param-request"
  (cl:format cl:nil "int32 section~%int32 param~%int32 value~%int32 dim~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <sens_param-request>))
  (cl:+ 0
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <sens_param-request>))
  "Converts a ROS message object to a list"
  (cl:list 'sens_param-request
    (cl:cons ':section (section msg))
    (cl:cons ':param (param msg))
    (cl:cons ':value (value msg))
    (cl:cons ':dim (dim msg))
))
;//! \htmlinclude sens_param-response.msg.html

(cl:defclass <sens_param-response> (roslisp-msg-protocol:ros-message)
  ((resp
    :reader resp
    :initarg :resp
    :type cl:string
    :initform ""))
)

(cl:defclass sens_param-response (<sens_param-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <sens_param-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'sens_param-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name umrr_driver-srv:<sens_param-response> is deprecated: use umrr_driver-srv:sens_param-response instead.")))

(cl:ensure-generic-function 'resp-val :lambda-list '(m))
(cl:defmethod resp-val ((m <sens_param-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader umrr_driver-srv:resp-val is deprecated.  Use umrr_driver-srv:resp instead.")
  (resp m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <sens_param-response>) ostream)
  "Serializes a message object of type '<sens_param-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'resp))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'resp))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <sens_param-response>) istream)
  "Deserializes a message object of type '<sens_param-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<sens_param-response>)))
  "Returns string type for a service object of type '<sens_param-response>"
  "umrr_driver/sens_paramResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'sens_param-response)))
  "Returns string type for a service object of type 'sens_param-response"
  "umrr_driver/sens_paramResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<sens_param-response>)))
  "Returns md5sum for a message object of type '<sens_param-response>"
  "d082684b67b68ff067addfa1087d79e3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'sens_param-response)))
  "Returns md5sum for a message object of type 'sens_param-response"
  "d082684b67b68ff067addfa1087d79e3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<sens_param-response>)))
  "Returns full string definition for message of type '<sens_param-response>"
  (cl:format cl:nil "string resp~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'sens_param-response)))
  "Returns full string definition for message of type 'sens_param-response"
  (cl:format cl:nil "string resp~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <sens_param-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'resp))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <sens_param-response>))
  "Converts a ROS message object to a list"
  (cl:list 'sens_param-response
    (cl:cons ':resp (resp msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'sens_param)))
  'sens_param-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'sens_param)))
  'sens_param-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'sens_param)))
  "Returns string type for a service object of type '<sens_param>"
  "umrr_driver/sens_param")