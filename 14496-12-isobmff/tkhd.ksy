meta:
  id: tkhd
  endian: be

params:
  - id: version
    type: u1
  - id: flags
    type: str
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
  - id: track_id
    type:
      switch-on: version
      cases:
        0: u4
        1: u4
  - id: reserved1
    contents: [0x00, 0x00, 0x00, 0x00]
  - id: duration
    type:
      switch-on: version
      cases:
        0: u4
        1: u8
  - id: reserved2
    contents: [0x00, 0x00, 0x00, 0x00]
    repeat: expr
    repeat-expr: 2
  - id: layer
    type: s2
  - id: alternate_group
    type: s2
  - id: volume
    type: s2
  - id: reserved3
    contents: [0x00, 0x00]
  - id: matrix
    type: s4
    # { 0x00010000,0,0,0,0x00010000,0,0,0,0x40000000 }, Unity matrix
    repeat: expr
    repeat-expr: 9
  - id: width
    type: u4
  - id: height
    type: u4
