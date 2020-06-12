meta:
  id: stsd
  endian: be

seq:
  - id: entry_count
    type: u4
  - id: sample_entries
    type: sample_entry
    repeat: expr
    repeat-expr: entry_count

types:
  sample_entry:
    seq:
      - id: size
        type: u4
      - id: type
        type: u4
        enum: format
      - id: reserved
        contents: [0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
      - id: data_reference_index
        type: u2
enums:  
  format:
    0x61766331: avc1
    0x6D703461: mp4a
