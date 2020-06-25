meta:
  id: mehd
  endian: be

doc: Movie Extends Header Box

doc-ref: ISO/IEC 14496-12:2015, section 8.8.2

params:
  - id: version
    type: u1

seq:
  - id: fragment_duration
    doc: |
      is an integer that declares length of the presentation of the whole movie
      including fragments (in the timescale indicated in the Movie Header Box).
      The value of this field corresponds to the duration of the longest track,
      including movie fragments. If an MP4 file is created in real-time, such as
      used in live streaming, it is not likely that the fragment_duration is
      known in advance and this box may be omitted.
    type:
      switch-on: version
      cases:
        0: u4
        1: u8
