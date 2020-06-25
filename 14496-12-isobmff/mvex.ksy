meta:
  id: mvex
  endian: be
  imports:
    - mehd
    - trex
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
            'box_type::mehd': mehd(version)
            'box_type::trex': trex
            _: default

    instances:
      header_size:
        value: 8 + is_full_box.to_i * 4
      is_full_box:
        value: (type == box_type::mehd or
                type == box_type::trex)

enums:
  box_type:
    0x6d656864: mehd
    0x74726578: trex
