meta:
  id: meta
  endian: be
  imports:
    - dinf
    - hdlr
    - iloc
    - default

params:
  - id: version
    type: u1

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
            'box_type::dinf': dinf
            'box_type::hdlr': hdlr
            'box_type::iloc': iloc(version, flags.to_s)
            _: default

    instances:
      header_size:
        value: 8 + is_full_box.to_i * 4

      is_full_box:
        value: (type == box_type::hdlr or
                type == box_type::iloc)
enums:
  box_type:
    0x64696E66: dinf
    0x68646C72: hdlr
    0x69696E66: iinf
    0x696C6F63: iloc
    0x786D6C20: xml
