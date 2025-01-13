
(cl:in-package :asdf)

(defsystem "umrr_driver-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "sens_param" :depends-on ("_package_sens_param"))
    (:file "_package_sens_param" :depends-on ("_package"))
    (:file "sens_param_req" :depends-on ("_package_sens_param_req"))
    (:file "_package_sens_param_req" :depends-on ("_package"))
    (:file "sens_status" :depends-on ("_package_sens_status"))
    (:file "_package_sens_status" :depends-on ("_package"))
  ))