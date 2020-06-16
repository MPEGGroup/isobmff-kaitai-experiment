meta:
  id: visual_sample_entry
  endian: be

seq:
  - id: pre_defined_1
    contents: [0x00, 0x00]
  - id: reserved_1
    contents: [0x00, 0x00]
  - id: pre_defined_2
    contents: [0x00, 0x00, 0x00, 0x00]
    repeat: expr
    repeat-expr: 3
  - id: width
    type: u2
  - id: height
    type: u2
  - id: horizersolution
    type: u4
    #default: 0x00480000
  - id: verizersolution
    type: u4
    #default: 0x00480000
  - id: reserved_2
    contents: [0x00, 0x00, 0x00, 0x00]
  - id: frame_count
    type: u2
    #default: 1
  - id: compressorname
    size: 32
  - id: depth
    type: u2
    #default: 0x0018
  - id: pre_defined_3
    type: s2
  #- id: clap
  #- id: pasp    

