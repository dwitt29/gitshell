#!/bin/bash

while read up idle
do
	echo $idle
	echo $up
	echo "scale=4;$idle / $up * 100" | bc -l
	per_free=$(( $idle/$up ))
done < /proc/uptime

echo $per_free
