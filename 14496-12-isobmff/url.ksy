meta:
  id: url
  endian: be

doc: Data Entry Url Box

doc-ref: ISO/IEC 14496-12:2015, section 8.7.2

params:
  - id: entry_flags
    type: str

seq:
  - id: location
    type: strz
    encoding: UTF-8
    if: entry_flags != "1"
    doc: |
       is a required URL, where it gives a location to find the resource with
       the given name. It is a null-terminated string using UTF-8 characters.
       If the self-contained flag is set, the URL form is used and no string is
       present; the box terminates with the entry-flags field. The URL type
       should be of a service that delivers a file (e.g. URLs of type file,
       http, ftp etc.), and which services ideally also permit random access.
       Relative URLs are permissible and are relative to the file containing
       the Movie Box that contains this data reference.
