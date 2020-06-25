meta:
  id: minf
  endian: be
  imports:
    - stbl
    - vmhd
    - default

doc: Media Information Box

doc-ref: ISO/IEC 14496-12:2015, section 8.4.4

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
            'box_type::stbl': stbl
            'box_type::vmhd': vmhd
            _: default
    instances:
      header_size:
        value: 8 + is_full_box.to_i * 4
      is_full_box:
        value: (type == box_type::vmhd or
                type == box_type::smhd)
enums:
  box_type:
    0x64696E66: dinf
    0x736D6864: smhd
    0x7374626c: stbl
    0x766D6864: vmhd
