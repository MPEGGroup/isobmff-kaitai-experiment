meta:
  id: mvhd
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
  - id: rate
    type: s4
    # 0x00010000, typically 1.0
  - id: volume
    type: s2
    # 0x0100, typically, full volume
  - id: reserved1
    contents: [0x00, 0x00]
  - id: reserved2
    contents: [0x00, 0x00, 0x00, 0x00]
    repeat: expr
    repeat-expr: 2
  - id: matrix
    type: s4 
    # { 0x00010000,0,0,0,0x00010000,0,0,0,0x40000000 }, Unity matrix
    repeat: expr
    repeat-expr: 9
  - id: pre_defined
    type: b32
    repeat: expr
    repeat-expr: 6
  - id: next_track_id
    type: u4
