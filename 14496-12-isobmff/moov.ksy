meta:
  id: moov
  endian: be
  imports:
    - meta
    - mvhd
    - mvex
    - trak
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
            'box_type::meta': meta(version)
            'box_type::mvhd': mvhd(version)
            'box_type::mvex': mvex
            'box_type::trak': trak
            _: default

    instances:
      header_size:
        value: 8 + is_full_box.to_i * 4

      is_full_box:
        value: (type == box_type::meta or
                type == box_type::mvhd)

enums:
  box_type:
    0x6d657461: meta
    0x6d766864: mvhd
    0x7472616b: trak
    0x6d766578: mvex
    0x75647461: udta
