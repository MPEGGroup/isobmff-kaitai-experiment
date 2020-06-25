meta:
  id: stsd
  endian: be
  imports:
    - sample_entry

doc: Sample Description Box

doc-ref: ISO/IEC 14496-12:2015, section 8.5.2

seq:
  - id: entry_count
    type: u4
    doc: is an integer that gives the number of entries in the following table

  - id: sample_entries
    type: sample_entry
    repeat: expr
    repeat-expr: entry_count
    doc: is the appropriate sample entry.
