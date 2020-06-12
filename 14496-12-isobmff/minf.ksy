meta:
  id: minf
  endian: be
  imports:
    - stbl
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
            'box_type::stbl': stbl
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
