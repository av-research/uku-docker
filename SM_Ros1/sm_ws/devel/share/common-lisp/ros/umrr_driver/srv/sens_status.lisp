; Auto-generated. Do not edit!


(cl:in-package umrr_driver-srv)


;//! \htmlinclude sens_status-request.msg.html

(cl:defclass <sens_status-request> (roslisp-msg-protocol:ros-message)
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
   (type
    :reader type
    :initarg :type
    :type cl:string
    :initform ""))
)

(cl:defclass sens_status-request (<sens_status-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <sens_status-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'sens_status-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name umrr_driver-srv:<sens_status-request> is deprecated: use umrr_driver-srv:sens_status-request instead.")))

(cl:ensure-generic-function 'section-val :lambda-list '(m))
(cl:defmethod section-val ((m <sens_status-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader umrr_driver-srv:section-val is deprecated.  Use umrr_driver-srv:section instead.")
  (section m))

(cl:ensure-generic-function 'param-val :lambda-list '(m))
(cl:defmethod param-val ((m <sens_status-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader umrr_driver-srv:param-val is deprecated.  Use umrr_driver-srv:param instead.")
  (param m))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <sens_status-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader umrr_driver-srv:type-val is deprecated.  Use umrr_driver-srv:type instead.")
  (type m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <sens_status-request>) ostream)
  "Serializes a message object of type '<sens_status-request>"
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
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'type))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'type))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <sens_status-request>) istream)
  "Deserializes a message object of type '<sens_status-request>"
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
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'type) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'type) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<sens_status-request>)))
  "Returns string type for a service object of type '<sens_status-request>"
  "umrr_driver/sens_statusRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'sens_status-request)))
  "Returns string type for a service object of type 'sens_status-request"
  "umrr_driver/sens_statusRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<sens_status-request>)))
  "Returns md5sum for a message object of type '<sens_status-request>"
  "93c8fafc2bd33a52659a315b24e02f5f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'sens_status-request)))
  "Returns md5sum for a message object of type 'sens_status-request"
  "93c8fafc2bd33a52659a315b24e02f5f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<sens_status-request>)))
  "Returns full string definition for message of type '<sens_status-request>"
  (cl:format cl:nil "int32 section~%int32 param~%string type~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'sens_status-request)))
  "Returns full string definition for message of type 'sens_status-request"
  (cl:format cl:nil "int32 section~%int32 param~%string type~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <sens_status-request>))
  (cl:+ 0
     4
     4
     4 (cl:length (cl:slot-value msg 'type))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <sens_status-request>))
  "Converts a ROS message object to a list"
  (cl:list 'sens_status-request
    (cl:cons ':section (section msg))
    (cl:cons ':param (param msg))
    (cl:cons ':type (type msg))
))
;//! \htmlinclude sens_status-response.msg.html

(cl:defclass <sens_status-response> (roslisp-msg-protocol:ros-message)
  ((resp
    :reader resp
    :initarg :resp
    :type cl:string
    :initform ""))
)

(cl:defclass sens_status-response (<sens_status-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <sens_status-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'sens_status-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name umrr_driver-srv:<sens_status-response> is deprecated: use umrr_driver-srv:sens_status-response instead.")))

(cl:ensure-generic-function 'resp-val :lambda-list '(m))
(cl:defmethod resp-val ((m <sens_status-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader umrr_driver-srv:resp-val is deprecated.  Use umrr_driver-srv:resp instead.")
  (resp m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <sens_status-response>) ostream)
  "Serializes a message object of type '<sens_status-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'resp))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'resp))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <sens_status-response>) istream)
  "Deserializes a message object of type '<sens_status-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<sens_status-response>)))
  "Returns string type for a service object of type '<sens_status-response>"
  "umrr_driver/sens_statusResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'sens_status-response)))
  "Returns string type for a service object of type 'sens_status-response"
  "umrr_driver/sens_statusResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<sens_status-response>)))
  "Returns md5sum for a message object of type '<sens_status-response>"
  "93c8fafc2bd33a52659a315b24e02f5f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'sens_status-response)))
  "Returns md5sum for a message object of type 'sens_status-response"
  "93c8fafc2bd33a52659a315b24e02f5f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<sens_status-response>)))
  "Returns full string definition for message of type '<sens_status-response>"
  (cl:format cl:nil "string resp~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'sens_status-response)))
  "Returns full string definition for message of type 'sens_status-response"
  (cl:format cl:nil "string resp~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <sens_status-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'resp))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <sens_status-response>))
  "Converts a ROS message object to a list"
  (cl:list 'sens_status-response
    (cl:cons ':resp (resp msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'sens_status)))
  'sens_status-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'sens_status)))
  'sens_status-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'sens_status)))
  "Returns string type for a service object of type '<sens_status>"
  "umrr_driver/sens_status")