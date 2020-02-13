meta:
  id: moov
  endian: be
  imports:
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
      - id: data
        size: size - 8
        type:
          switch-on: type
          cases:
            'box_type::mvhd': default
            _: default

enums:
  box_type:
    0x6d766864: mvhd
    0x6d657461: meta
    0x7472616b: trak
    0x6d766578: mvex
    0x75647461: udta
