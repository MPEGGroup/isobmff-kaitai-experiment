meta:
  id: stsc
  endian: be

doc: Sample To Chunk Box

doc-ref: ISO/IEC 14496-12:2015, section 8.7.4

types:
  sample_info:
    seq:
      - id: first_chunk
        type: u4
        doc: |
          is an integer that gives the index of the first chunk in this run of
          chunks that share the same samples-per-chunk and
          sample-description-index; the index of the first chunk in a track has
          the value 1 (the first_chunk field in the first record of this box
          has the value 1, identifying that the first sample maps to the first
          chunk).

      - id: sample_per_chunk
        type: u4
        doc: is an integer that gives the number of samples in each of these chunks

      - id: sample_description_index
        type: u4
        doc: |
          is an integer that gives the index of the sample entry that describes
          the samples in this chunk. The index ranges from 1 to the number of
          sample entries in the Sample Description Box.

seq:
  - id: entry_count
    type: u4
    doc: is an integer that gives the number of entries in the following table

  - id: sample_info
    type: sample_info
    repeat: expr
    repeat-expr: entry_count
