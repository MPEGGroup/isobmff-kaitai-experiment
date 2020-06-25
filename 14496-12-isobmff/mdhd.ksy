meta:
  id: mdhd
  endian: be

doc: Media Header Box

doc-ref: ISO/IEC 14496-12:2015, section 8.4.2

params:
  - id: version
    type: u1
    doc: is an integer that specifies the version of this box (0 or 1).

seq:
  - id: creation_time
    type:
      switch-on: version
      cases:
        0: u4
        1: u8
    doc: |
      is an integer that declares the creation time of the media in this track
      (in seconds since midnight, Jan. 1, 1904, in UTC time).

  - id: modification_time
    type:
      switch-on: version
      cases:
        0: u4
        1: u8
    doc: |
      is an integer that declares the most recent time the media in this track
      was modified (in seconds since midnight, Jan. 1, 1904, in UTC time).

  - id: timescale
    type:
      switch-on: version
      cases:
        0: u4
        1: u4
    doc: |
      is an integer that specifies the time-scale for this media; this is the
      number of time units that pass in one second. For example, a time
      coordinate system that measures time in sixtieths of a second has a time
      scale of 60.

  - id: duration
    type:
      switch-on: version
      cases:
        0: u4
        1: u8
    doc: |
        is an integer that declares the duration of this media (in the scale
        of the timescale). If the duration cannot be determined then duration
        is set to all 1s.

  - id: pad
    type: b1

  - id: language
    type: b5
    repeat: expr
    repeat-expr: 3
    doc: |
      declares the language code for this media. See ISO 639-2/T for the set
      of three character codes. Each character is packed as the difference
      between its ASCII value and 0x60. Since the code is confined to being
      three lower-case letters, these values are strictly positive.

  - id: pre_defined
    contents: [0x00, 0x00]
