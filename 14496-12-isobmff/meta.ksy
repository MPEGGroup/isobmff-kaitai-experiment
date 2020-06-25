meta:
  id: meta
  endian: be

seq:
  - id: the_handler
    type: box('box_type::hdlr')
  
types:
  box:
    seq:
      - id: size
        type: u4
      - id: type
        type: u4
        enum: box_type
      - id: data
        size: size - 8
        type: box_type

enums:
  box_type:
    0x68646C72: hdlr
