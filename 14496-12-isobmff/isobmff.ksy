meta:
  id: isobmff
  title: ISO Base Media File Format (ISOBMFF)
  endian: be
  imports:
    - ftyp
    - moov
    - default

doc: |
  This part of ISO/IEC 14496 specifies the ISO base media file format, which is
  a general format forming the basis for a number of other more specific file
  formats. This format contains the timing, structure, and media information for
  timed sequences of media data, such as audio-visual presentations.This part
  of ISO/IEC 14496 is applicable to MPEG-4, but its technical content is
  identical to that of ISO/IEC 15444-12, which is applicable to JPEG 2000.

seq:
  - id: boxes
    type: box
    repeat: until
    repeat-until: _io.eof

types:
  box:
    seq:
      - id: size
        type: u4
      - id: type
        type: u4
        enum: box_type
      - id: data
        size: size - 8
        type:
          switch-on: type
          cases:
            'box_type::ftyp': ftyp
            'box_type::moov': moov
            _: default

enums:
  box_type:
    0x66747970: ftyp
    0x66726565: free
    0x6d646174: mdat
    0x6D6F6F66: moof
    0x6d6f6f76: moov
    0x73696478: sidx
    0x73747970: styp
