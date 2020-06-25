meta:
  id: hdlr
  endian: be

doc: Handler Reference Box

doc-ref: ISO/IEC 14496-12:2015, section 8.4.3

seq:
  - id: pre_defined
    contents: [0x00, 0x00, 0x00, 0x00]

  - id: handler_type
    type: u4
    enum: handler_type
    doc: |
      * when present in a media box, contains a value as defined in clause
        12, or a value from a derived specification, or registration.
      * when present in a meta box, contains an appropriate value to indicate
        the format of the meta box contents. The value ‘null’ can be used in
        the primary meta box to indicate that it is merely being used to hold
        resources.

  - id: reserved
    type: u4
    repeat: expr
    repeat-expr: 3

  - id: name
    type: strz
    encoding: UTF-8
    doc: |
      is a null-terminated string in UTF-8 characters which gives a
      human-readable name for the track type (for debugging and inspection
      purposes).

enums:
  handler_type:
    # ISO/IEC 14496-12:2015
    0x61757876: auxv
    0x6e756c6c: 'null'
    0x736f756e: soun
    0x76696465: vide
