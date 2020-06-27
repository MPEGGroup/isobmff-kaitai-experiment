meta:
  id: ftyp
  endian: be

doc: File Type Box

doc-ref: ISO/IEC 14496-12:2015, section 4.3

seq:
  - id: major_brand
    type: u4
    enum: brand
    doc: is a brand identifier

  - id: minor_version
    type: u4
    doc: is an informative integer for the minor version of the major brand

  - id: compatible_brands
    type: u4
    enum: brand
    repeat: eos
    doc: is a list, to the end of the box, of brands

enums:
  brand:
    0x69736F32: iso2
    0x69736F35: iso5
    0x69736F36: iso6
    0x69736F6D: isom
    0x6D703431: mp41
    # ISO/IEC 14496-15
    0x61766331: avc1
    # ISO/IEC 23009-1
    0x64617368: dash
