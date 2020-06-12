#!/usr/bin/env bash

ksc -t python ../14496-12-isobmff/isobmff.ksy

python3 dump.py "./vectors/1.mp4"
