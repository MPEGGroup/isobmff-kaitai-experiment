#!/usr/bin/env python3

import pprint
from sys import argv
import isobmff

INPUT_FILE = argv[1]

print("Parsing {}".format(INPUT_FILE))

mp4 = isobmff.Isobmff.from_file(INPUT_FILE)

print("")

def print_data(box):
    # We get all the fields of the box ('_' are internal attributes and 'blob' is the default box)
    fields = [f for f in box.data.__dict__ if not f.startswith('_') and f != "blob"]
    if "boxes" in fields:
        for child_box in box.data.boxes:
            print_box(child_box)
    else:
        for field in fields:
            if field == "sample_entries":
                for sample_entry in box.data.sample_entries:
                    print(("{}").format(sample_entry.type))
            else:
                print(("{}: {}").format(field, getattr(box.data, field)))

def print_box(box):
    print("size: ", box.size)
    print("type: ", box.type)
    print_data(box)

for box in mp4.boxes:
    print_box(box)
