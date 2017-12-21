#!/bin/bash

set -- "First one" "second" "third:one" "" "Fifth: :one"

echo

c=0
for i in "$*"
do
	echo "$((c++)): [$i]"
done
echo "-----"
c=0
for i in $*
do
	echo "$((c++)): [$i]"
done
echo "-----"
c=0
for i in "$@"
do
	echo "$((c++)): [$i]"
done
echo "-----"
c=0
for i in $@
do
	echo "$((c++)): [$i]"
done
echo "------------------------"


IFS=":"
c=0
for i in "$*"
do
	echo "$((c++)): [$i]"
done
echo "-----"
c=0
for i in $*
do
	echo "$((c++)): [$i]"
done
echo "-----"
c=0
for i in "$@"
do
	echo "$((c++)): [$i]"
done
echo "-----"
c=0
for i in $@
do
	echo "$((c++)): [$i]"
done
echo "-----"
