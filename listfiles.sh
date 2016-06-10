#!/bin/bash

pwd=`pwd`

i=1
k=1

for infile in `ls -a *.wav`  
do  
	path="/home/yvsm/Documents/DataSet_Work/Raw/"
	file1="outfile"
	ext1=".raw"
	outfile="$path$file1$ext1"
	sox "$infile" -b 16 -s -c 1 -r 48k -t raw "$outfile"
	
	path1="/home/yvsm/Documents/DataSet_Work/Wav48k/"
	file2="output.wav"
	output="$path1$file2"
	
	sox -b 16 -s -c 1 -r 48k -t raw "$outfile" "$output"

	path2="/home/yvsm/Documents/DataSet_Work/final/"
	file3="$infile"
	output1="$path2$file3"

	sox "$output" -r 8000 "$output1"

	print="Done :: $i"

	i=`expr $i + 1`
done 
