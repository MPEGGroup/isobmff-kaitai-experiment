meta:
  id: mdia
  endian: be
  imports:
    - mdhd
    - default

seq:
  - id: boxes
    type: box
    repeat: eos

types:
  box:
    seq:
      - id: size
        type: u4
      - id: type
        type: u4
        enum: box_type
      - id: version
        type: u1
        if: is_full_box
      - id: flags
        type: b24
        if: is_full_box
      - id: data
        size: size - header_size
        type:
          switch-on: type
          cases:
            'box_type::mdhd': mdhd(version)
            _: default
    instances:
      header_size:
        value: 8 + is_full_box.to_i * 4
      is_full_box:
        value: type == box_type::mdhd

enums:
  box_type:
    0x68646C72: hdlr
    0x6D646864: mdhd
    0x6D696E66: minf
