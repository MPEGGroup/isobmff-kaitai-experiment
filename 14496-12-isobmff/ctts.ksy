meta:
  id: ctts
  endian: be

params:
  - id: version
    type: u1

types:
  entry:
    params:
      - id: version
        type: u1
    seq:
      - id: sample_count
        type:
          switch-on: version
          cases:
            0: u4
            1: u4
      - id: sample_offset
        type:
          switch-on: version
          cases:
            0: u4
            1: s4
seq:
  - id: entry_count
    type: u4
  - id: entries
    type: entry(version)
    repeat: expr
    repeat-expr: entry_count
