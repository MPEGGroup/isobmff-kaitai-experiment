meta:
  id: stts
  endian: be

doc: Sample Table Box

doc-ref: ISO/IEC 14496-12:2015, section 8.5.1

types:
  sample_info:
    seq:
      - id: sample_count
        type: u4
        doc: |
          is an integer that counts the number of consecutive samples that
          have the given duration.

      - id: sample_delta
        type: u4
        doc: |
          is an integer that gives the delta of these samples in the time-scale
          of the media.

seq:
  - id: entry_count
    type: u4
    doc: is an integer that gives the number of entries in the following table.

  - id: sample_info
    type: sample_info
    repeat: expr
    repeat-expr: entry_count
