meta:
  id: ftyp
  endian: be

seq:
  - id: major_brand
    type: u4
    enum: brand
  - id: minor_version
    type: u4
  - id: compatible_brands
    type: u4
    enum: brand
    repeat: eos

enums:
  brand:
    0x69736F6D: isom
    0x6D703431: mp41
    0x69736F32: iso2
    0x61766331: avc1
