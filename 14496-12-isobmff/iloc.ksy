meta:
  id: iloc
  endian: be

params:
  - id: version
    type: u1
  - id: flags
    type: str

seq:
  - id: offset_size
    type: b4
  - id: length_size
    type: b4
  - id: base_offset_size
    type: b4
  - id: index_size
    type: b4
  # Below is the syntax in the spec but apparently not followed. Problem is index_size cannot be optional.
  #  if: version == 1 or version == 2
  #- id: reserved
  #  type: b4
  #  if: version != 1 and version != 2
  - id: item_count
    type:
      switch-on: version
      cases:
        0: u2
        1: u2
        2: u4
  - id: resources
    type: resource_item(version, base_offset_size, index_size, offset_size, length_size)
    repeat: expr
    repeat-expr: item_count

types:
  extent:
    params:
      - id: version
        type: u1
      - id: index_size
        type: u1
      - id: offset_size
        type: u1
      - id: length_size
        type: u1

    seq:
      - id: extent_index
        type: 
          switch-on: index_size
          cases:
            4: u4 
            8: u8
        if: (version == 1 or version == 2) and (index_size > 0)
      - id: extent_offset
        type: 
          switch-on: offset_size
          cases:
            4: u4 
            8: u8
      - id: extent_length
        type: 
          switch-on: length_size
          cases:
            4: u4 
            8: u8

  resource_item:
    params:
      - id: version
        type: u1
      - id: base_offset_size
        type: u1
      - id: index_size
        type: u1
      - id: offset_size
        type: u1
      - id: length_size
        type: u1

    seq:
      - id: item_id
        type:
          switch-on: version
          cases:
            0: u2
            1: u2
            2: u4
      - id: reserved
        type: b12
        if: version == 1 or version == 2
      - id: construction_method
        type: b4
        if: version == 1 or version == 2
      - id: data_reference_index
        type: u2
      - id: base_offset
        type:
          switch-on: base_offset_size
          cases:
            4: u4 
            8: u8
      - id: extent_count
        type: u2
      - id: extents
        type: extent(version, index_size, offset_size, length_size)
        repeat: expr
        repeat-expr: extent_count
