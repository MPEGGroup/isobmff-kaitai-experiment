meta:
  id: stbl
  endian: be
  imports:
    - stsd
    - stts
    - default

doc: Sample Table Box

doc-ref: ISO/IEC 14496-12:2015, section 8.5.1

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
            'box_type::stsd': stsd
            'box_type::stts': stts
            _: default

    instances:
      header_size:
        value: 8 + is_full_box.to_i * 4

      is_full_box:
        value: (type == box_type::ctts or
                type == box_type::sbgp or
                type == box_type::sgpd or
                type == box_type::stco or
                type == box_type::stsc or
                type == box_type::stsd or
                type == box_type::stts or
                type == box_type::stss)
enums:
  box_type:
    0x63747473: ctts
    0x73626770: sbgp
    0x73677064: sgpd
    0x7374636f: stco
    0x73747363: stsc
    0x73747364: stsd
    0x73747473: stts
    0x73747373: stss
    0x7374737A: stsz
