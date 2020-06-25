meta:
  id: meta
  endian: be

seq:
  - id: pre_defined
    contents: [0x00, 0x00, 0x00, 0x00]
  - id: handler_type
    type: u4
    enum: handler_type
  - id: reserved
    type: u4
    repeat: expr
    repeat-expr: 3
  - id: name
    type: strz
    encoding: UTF-8
