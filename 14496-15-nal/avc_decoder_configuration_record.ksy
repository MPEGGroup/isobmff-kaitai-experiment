meta:
  id: avc_decoder_configuration_record
  endian: be

seq:
  - id: configuration_version
    type: u1
  - id: avc_profile_indication
    type: u1
  - id: profile_compatibility
    type: u1
  - id: avc_level_indication
    type: u1
  - id: reserved_1
    type: b6
  - id: length_size_minus_one
    type: b2
  - id: reserved_2
    type: b3
  - id: num_of_sequence_parameter_sets
    type: b5
  - id: sequence_parameter_sets
    type: parameter_set
    repeat: expr
    repeat-expr: num_of_sequence_parameter_sets
  - id: num_of_picture_parameter_sets
    type: u1
  - id: picture_parameter_sets
    type: parameter_set
    repeat: expr
    repeat-expr: num_of_picture_parameter_sets
  - id: reserved_3
    type: b6
    if: ext_present
  - id: chroma_format
    type: b2
    if: ext_present
  - id: reserved_4
    type: b5
    if: ext_present
  - id: bit_depth_luma_minus8
    type: b3
    if: ext_present
  - id: reserved_5
    type: b5
    if: ext_present
  - id: bit_depth_chroma_minus8
    type: b3
    if: ext_present
  - id: num_of_sequence_parameter_set_exts
    type: u1
    if: ext_present
  - id: sequence_parameter_set_exts
    type: parameter_set
    if: ext_present
    repeat: expr
    repeat-expr: num_of_sequence_parameter_set_exts
instances:
  ext_present:
    value: (avc_profile_indication != 66 and
            avc_profile_indication != 77 and
            avc_profile_indication != 88)

types:
  parameter_set:
    seq:
      - id: parameter_set_length
        type: u2
      - id: parameter_set_nal_unit
        size: parameter_set_length 
