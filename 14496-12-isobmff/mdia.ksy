meta:
  id: mdia
  endian: be
  imports:
    - hdlr
    - minf
    - mdhd
    - default

doc: Media Box

doc-ref: ISO/IEC 14496-12:2015, section 8.4.1

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
            'box_type::hdlr': hdlr
            'box_type::mdhd': mdhd(version)
            'box_type::minf': minf
            _: default

    instances:
      header_size:
        value: 8 + is_full_box.to_i * 4

      is_full_box:
        value: (type == box_type::mdhd or
                type == box_type::hdlr)

enums:
  box_type:
    0x68646C72: hdlr
    0x6D646864: mdhd
    0x6D696E66: minf
