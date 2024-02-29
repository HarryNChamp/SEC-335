#! /bin/bash

["$#" -ne 2] && echo "usage: $0 <hostfile> <portfile>" && exit 1

prefix=$1
port=$2

echo "host,port,status"

for i in {1..254}
do
timeout .1 bash -c "echo 2>/dev/tcp/${prefix}.${i}/${port}" 2>/dev/null && status="open" || status="closed"
echo "${prefix}.${i},$port,$status"
done
