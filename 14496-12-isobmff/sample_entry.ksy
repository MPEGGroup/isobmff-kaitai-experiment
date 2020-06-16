meta:
  id: sample_entry
  endian: be
  imports:
    - ../14496-15-nal/avc1
    - default

seq:
  - id: size
    type: u4
  - id: type
    type: u4
    enum: format
  - id: reserved
    contents: [0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
  - id: data_reference_index
    type: u2
  - id: data
    size: size - 16
    type:
      switch-on: type
      cases:
        'format::avc1': avc1
        _: default

enums:  
  format:
    0x61766331: avc1
    0x6D703461: mp4a
