meta:
  id: mdhd
  endian: be

params:
  - id: version
    type: u1
seq:
  - id: creation_time
    type:
      switch-on: version
      cases:
        0: u4
        1: u8
  - id: modification_time
    type:
      switch-on: version
      cases:
        0: u4
        1: u8
  - id: timescale
    type:
      switch-on: version
      cases:
        0: u4
        1: u4
  - id: duration
    type:
      switch-on: version
      cases:
        0: u4
        1: u8
  - id: pad
    type: b1
  - id: language
    type: b5
    repeat: expr
    repeat-expr: 3
  - id: pre_defined
    contents: [0x00, 0x00]
