#!/bin/bash



exec 3</etc/hosts
exec 4</etc/passwd

#IFS=" "
#set -f
while read -r f1 f2 f3 f4  <&3
do
echo $f1
done 

#exec 3<&-
#exec 4<&-


while read -r f1 <&4
do
IFS=":"
echo $f1
done
