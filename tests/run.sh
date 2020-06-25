#!/usr/bin/env bash

ksc -t python ../14496-12-isobmff/isobmff.ksy

for isobmff_file in $(find ./vectors -type f -name "*.mp4")
do 
	python3 dump.py "$isobmff_fil$isobmff_file"
done
