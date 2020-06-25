meta:
  id: vmhd
  endian: be

doc: Video media header

doc-ref: ISO/IEC 14496-12:2015, section 12.1.2

seq:
  - id: graphicsmode
    type: u2
    doc: |
      specifies a composition mode for this video track, from the following
      enumerated set, which may be extended by derived specifications:
      * copy = 0 copy over the existing image

  - id: opcolor
    type: u2
    repeat: expr
    repeat-expr: 3
    doc: |
      is a set of 3 colour values (red, green, blue) available for use by
      graphics modes
