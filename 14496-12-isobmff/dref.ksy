meta:
  id: dref
  endian: be
  imports:
    - url
    - urn

doc: Data Reference Box

doc-ref: ISO/IEC 14496-12:2015, section 8.7.2

seq:
  - id: entry_count
    type: u4
    doc: is an integer that counts the actual entries

  - id: boxes
    type: box
    repeat: expr
    repeat-expr: entry_count

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

      - id: flags
        type: b24

      - id: data
        size: size - 12
        type:
          switch-on: type
          cases:
            'box_type::url': url(flags.to_s)
            'box_type::urn': urn(flags.to_s)
            _: default

enums:
  box_type:
    0x75726c20: url
    0x75726e20: urn
