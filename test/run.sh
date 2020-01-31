#!/usr/bin/env bash

ksc -t python ../isobmff-12/isobmff.ksy

python3 dump.py "./vectors/1.mp4"
