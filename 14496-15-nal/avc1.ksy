meta:
  id: avc1
  endian: be
  imports:
    - ../14496-12-isobmff/visual_sample_entry
    - ../14496-12-isobmff/default
    - avcc

seq:
  - id: visual
    type: visual_sample_entry
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
            'box_type::avcc': avcc
            #'box_type::md4s' m4ds # optional
            _: default
enums:  
  box_type:
    0x61766343: avcc #real ASCII value: avcC
