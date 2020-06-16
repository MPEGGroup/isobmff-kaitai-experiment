meta:
  id: stsd
  endian: be
  imports:
    - sample_entry

seq:
  - id: entry_count
    type: u4
  - id: sample_entries
    type: sample_entry
    repeat: expr
    repeat-expr: entry_count
