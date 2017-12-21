#!/bin/bash

echo $?
echo $$
echo $#
IFS=":"
echo $*
echo $@
echo "$*"
echo "$@"
declare -A c (( $@ ))
echo ${c}
a="$*"
b="$@"
echo $a
echo $b

echo $0
echo $1
echo $2

echo ${13}
