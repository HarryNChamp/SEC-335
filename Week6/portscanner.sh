#!/bin/bash

["$#" -ne 2] && echo "usage: $0 <hostfile> <portfile>" && exit 1

prefix=$1
port=$2 

# Verify file existence
# [ ! -r "$hostfile" ] || [ ! -r "$portfile" ] && echo "Error : Both files need to exist and be readable." && exit 1
#
echo "host,port"

for i in {1..254}
# check open ports
do
timeout .1 bash -c "echo 2>/dev/tcp/${prefix}.${i}/${port}" 2>/dev/null && 
echo "${prefix}.${i},$port"
done
