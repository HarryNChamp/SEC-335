#!/bin/bash

["$#" -ne 2] && echo "usage: $0 <hostfile> <portfile>" && exit 1

prefix=$1
fixed=$2

# Verify file existence
# [ ! -r "$hostfile" ] || [ ! -r "$portfile" ] && echo "Error : Both files need to exist and be readable." && exit 1
#
for i in {1..254}
# check open ports
do
nslookup ${prefix}.${i} ${fixed} | grep "name"
done
