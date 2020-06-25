meta:
  id: tref
  endian: be

doc: Track Reference Box

doc-ref: ISO/IEC 14496-12:2015, section 8.3.3

seq:
  - id: boxes
    type: box
    repeat: eos

types:
  track_reference_type:
    seq:
      - id: track_id
        type: u4
        repeat: eos
        doc: |
          is an integer that provides a reference from the containing track to
          another track in the presentation. track_IDs are never re-used and
          cannot be equal to zero.
  box:
    seq:
      - id: size
        type: u4
      - id: type
        type: u4
        enum: reference_type
      - id: data
        size: size - 8
        type:
          switch-on: type
          cases:
            'reference_type::cdsc': track_reference_type
            'reference_type::font': track_reference_type
            'reference_type::hind': track_reference_type
            'reference_type::hint': track_reference_type
            'reference_type::vdep': track_reference_type
            'reference_type::vplx': track_reference_type
            'reference_type::subt': track_reference_type

enums:
  reference_type:
    # ISO/IEC 14496-12:2015
    0x63647363: cdsc # this track describes the referenced track.
    0x666f6e74: font # this track uses fonts carried/defined in the referenced track.
    0x68696e64: hind # this track depends on the referenced hint track, i.e., it should only be used if the referenced hint track is used.
    0x68696e74: hint # the referenced track(s) contain the original media for this hint track.
    0x73756274: subt # this track contains subtitle, timed text or overlay graphical information for the referenced track or any track in the alternate group to which the track belongs, if any.
    0x76646570: vdep # this track contains auxiliary depth video information for the referenced video track.
    0x76706c78: vplx # this track contains auxiliary parallax video information for the referenced video track.
