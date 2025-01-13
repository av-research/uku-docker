// Auto-generated. Do not edit!

// (in-package umrr_driver.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class sens_param_reqRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.section = null;
      this.param = null;
    }
    else {
      if (initObj.hasOwnProperty('section')) {
        this.section = initObj.section
      }
      else {
        this.section = 0;
      }
      if (initObj.hasOwnProperty('param')) {
        this.param = initObj.param
      }
      else {
        this.param = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type sens_param_reqRequest
    // Serialize message field [section]
    bufferOffset = _serializer.int32(obj.section, buffer, bufferOffset);
    // Serialize message field [param]
    bufferOffset = _serializer.int32(obj.param, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type sens_param_reqRequest
    let len;
    let data = new sens_param_reqRequest(null);
    // Deserialize message field [section]
    data.section = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [param]
    data.param = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'umrr_driver/sens_param_reqRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ee7fb720fa0b0247c82d71fa3ef07771';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 section
    int32 param
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new sens_param_reqRequest(null);
    if (msg.section !== undefined) {
      resolved.section = msg.section;
    }
    else {
      resolved.section = 0
    }

    if (msg.param !== undefined) {
      resolved.param = msg.param;
    }
    else {
      resolved.param = 0
    }

    return resolved;
    }
};

class sens_param_reqResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.resp = null;
    }
    else {
      if (initObj.hasOwnProperty('resp')) {
        this.resp = initObj.resp
      }
      else {
        this.resp = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type sens_param_reqResponse
    // Serialize message field [resp]
    bufferOffset = _serializer.string(obj.resp, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type sens_param_reqResponse
    let len;
    let data = new sens_param_reqResponse(null);
    // Deserialize message field [resp]
    data.resp = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.resp);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'umrr_driver/sens_param_reqResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b791c1a4a4f0cee32b54dd1a73706a59';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string resp
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new sens_param_reqResponse(null);
    if (msg.resp !== undefined) {
      resolved.resp = msg.resp;
    }
    else {
      resolved.resp = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: sens_param_reqRequest,
  Response: sens_param_reqResponse,
  md5sum() { return '9a0eeee29694f2ca329fbb723ef7be91'; },
  datatype() { return 'umrr_driver/sens_param_req'; }
};
