meta:
  id: initialisation_segment
  title: Initialization Segment for OMAF base track
  endian: be
  imports:
    - ../14496-12-isobmff/ftyp
    - ../14496-12-isobmff/mvhd
    - ../14496-12-isobmff/mehd
    - ../14496-12-isobmff/trex

doc: Initialization Segment for OMAF base track

doc-ref: ISO/IEC 23090-2:2020, section 8.6.1

seq:
  # A Stream Header, rule ADTI.8
  - id: ftyp
    type: ftyp_box
  
  - id: moov
    type: moov_box

types:
  ftyp_box:
    seq:
      - id: size
        type: u4

      - id: type
        contents: ftyp

      - id: data
        size: size - 8
        type: ftyp
  
  moov_box:
    seq:
      - id: size
        type: u4

      - id: type
        contents: moov

      - id: mvhd
        type: mvhd_box

      - id: mvex
        type: mvex_box
  
  mvhd_box:
    seq:
      - id: size
        type: u4

      - id: type
        contents: mvhd

      - id: version
        type: u1

      - id: flags
        type: b24

      - id: data
        size: size - 12
        type: mvhd
  
  mvex_box:
    seq:
      - id: size
        type: u4

      - id: type
        contents: mvex
      
      - id: mehd
        type: mehd_box
      
      - id: trex
        type: trex_box
  
  mehd_box:
    seq:
      - id: size
        type: u4

      - id: type
        contents: mehd

      - id: version
        type: u1

      - id: flags
        type: b24

      - id: data
        size: size - 12
        type: mehd
  
  trex_box:
    seq:
      - id: size
        type: u4

      - id: type
        contents: trex

      - id: version
        type: u1

      - id: flags
        type: b24

      - id: data
        size: size - 12
        type: trex
