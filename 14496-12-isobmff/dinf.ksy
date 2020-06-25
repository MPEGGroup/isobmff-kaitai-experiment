meta:
  id: dinf
  endian: be
  imports:
    - dref
    - default

doc: Data Information Box

doc-ref: ISO/IEC 14496-12:2015, section 8.7.1

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
            'box_type::dref': dref
            _: default

    instances:
      header_size:
        value: 8 + is_full_box.to_i * 4

      is_full_box:
        value: (type == box_type::dref)
enums:
  box_type:
    0x64726566: dref
