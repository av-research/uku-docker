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

class sens_paramRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.section = null;
      this.param = null;
      this.value = null;
      this.dim = null;
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
      if (initObj.hasOwnProperty('value')) {
        this.value = initObj.value
      }
      else {
        this.value = 0;
      }
      if (initObj.hasOwnProperty('dim')) {
        this.dim = initObj.dim
      }
      else {
        this.dim = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type sens_paramRequest
    // Serialize message field [section]
    bufferOffset = _serializer.int32(obj.section, buffer, bufferOffset);
    // Serialize message field [param]
    bufferOffset = _serializer.int32(obj.param, buffer, bufferOffset);
    // Serialize message field [value]
    bufferOffset = _serializer.int32(obj.value, buffer, bufferOffset);
    // Serialize message field [dim]
    bufferOffset = _serializer.int32(obj.dim, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type sens_paramRequest
    let len;
    let data = new sens_paramRequest(null);
    // Deserialize message field [section]
    data.section = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [param]
    data.param = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [value]
    data.value = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [dim]
    data.dim = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a service object
    return 'umrr_driver/sens_paramRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c99ff11b99dc85ed748bf934bb5d14bf';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 section
    int32 param
    int32 value
    int32 dim
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new sens_paramRequest(null);
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

    if (msg.value !== undefined) {
      resolved.value = msg.value;
    }
    else {
      resolved.value = 0
    }

    if (msg.dim !== undefined) {
      resolved.dim = msg.dim;
    }
    else {
      resolved.dim = 0
    }

    return resolved;
    }
};

class sens_paramResponse {
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
    // Serializes a message object of type sens_paramResponse
    // Serialize message field [resp]
    bufferOffset = _serializer.string(obj.resp, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type sens_paramResponse
    let len;
    let data = new sens_paramResponse(null);
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
    return 'umrr_driver/sens_paramResponse';
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
    const resolved = new sens_paramResponse(null);
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
  Request: sens_paramRequest,
  Response: sens_paramResponse,
  md5sum() { return 'd082684b67b68ff067addfa1087d79e3'; },
  datatype() { return 'umrr_driver/sens_param'; }
};
