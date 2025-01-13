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

class sens_statusRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.section = null;
      this.param = null;
      this.type = null;
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
      if (initObj.hasOwnProperty('type')) {
        this.type = initObj.type
      }
      else {
        this.type = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type sens_statusRequest
    // Serialize message field [section]
    bufferOffset = _serializer.int32(obj.section, buffer, bufferOffset);
    // Serialize message field [param]
    bufferOffset = _serializer.int32(obj.param, buffer, bufferOffset);
    // Serialize message field [type]
    bufferOffset = _serializer.string(obj.type, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type sens_statusRequest
    let len;
    let data = new sens_statusRequest(null);
    // Deserialize message field [section]
    data.section = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [param]
    data.param = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [type]
    data.type = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.type);
    return length + 12;
  }

  static datatype() {
    // Returns string type for a service object
    return 'umrr_driver/sens_statusRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2e7b73d2c3ad243160428ecc93cd4758';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 section
    int32 param
    string type
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new sens_statusRequest(null);
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

    if (msg.type !== undefined) {
      resolved.type = msg.type;
    }
    else {
      resolved.type = ''
    }

    return resolved;
    }
};

class sens_statusResponse {
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
    // Serializes a message object of type sens_statusResponse
    // Serialize message field [resp]
    bufferOffset = _serializer.string(obj.resp, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type sens_statusResponse
    let len;
    let data = new sens_statusResponse(null);
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
    return 'umrr_driver/sens_statusResponse';
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
    const resolved = new sens_statusResponse(null);
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
  Request: sens_statusRequest,
  Response: sens_statusResponse,
  md5sum() { return '93c8fafc2bd33a52659a315b24e02f5f'; },
  datatype() { return 'umrr_driver/sens_status'; }
};
