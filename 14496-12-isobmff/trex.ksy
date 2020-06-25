meta:
  id: trex
  endian: be

doc: Track Extends Box

doc-ref: ISO/IEC 14496-12:2015, section 8.8.3

seq:
  - id: track_id
    type: u4
    doc: identifies the track; this shall be the track ID of a track in the Movie Box
  - id: default_sample_description_index
    type: u4
    doc: this field sets up defaults used in the track fragments.
  - id: default_sample_duration
    type: u4
    doc: this field sets up defaults used in the track fragments.
  - id: default_sample_size
    type: u4
    doc: this field sets up defaults used in the track fragments.
  - id: default_sample_flags
    type: default_sample_flags
    doc: this field sets up defaults used in the track fragments.

types:
  default_sample_flags:
    seq:
      - id: reserved
        type: b4
      - id: is_leading
        type: b2
      - id: sample_depends_on
        type: b2
      - id: sample_is_depended_on
        type: b2
      - id: sample_has_redundancy
        type: b2
      - id: sample_padding_value
        type: b3
      - id: sample_is_non_sync_sample
        type: b1
      - id: sample_degradation_priority
        type: u2

