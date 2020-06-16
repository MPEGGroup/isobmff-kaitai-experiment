#!/usr/bin/env python3

import pprint
from sys import argv
import isobmff

INPUT_FILE = argv[1]

print('Parsing {}'.format(INPUT_FILE))

mp4 = isobmff.Isobmff.from_file(INPUT_FILE)

print('')

def print_field(field_name, obj):
    print(("{}: {}").format(field_name, getattr(obj, field_name)))

def print_data(obj):
    if not hasattr(obj, '__dict__'):
        return

    # We get all the fields of the object ('_' are internal attributes)
    fields = [f for f in obj.__dict__ if not f.startswith('_') and f != 'blob']
    for field in fields:
        if field == 'boxes' or field == 'sample_entries':
            continue
        elif hasattr(getattr(obj, field), '__dict__'):
            print_data(getattr(obj, field))
        else:
            print_field(field, obj)

def print_data_box(box):
    print_data(box.data)
    if hasattr(box.data, 'boxes'):
        for child_box in box.data.boxes:
            print_box(child_box)
    elif hasattr(box.data, 'sample_entries'):
        for sample_entry in box.data.sample_entries:
            print_box(sample_entry)

def print_box(box):
    print('size: ', box.size)
    print('type: ', box.type)
    print_data_box(box)

for box in mp4.boxes:
    print_box(box)
