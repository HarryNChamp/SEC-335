#!/bin/bash

["$#" -ne 2] && echo "usage: $0 <hostfile> <portfile>" && exit 1

hostfile=$1
portfile=$2

# Verify file existence
[ ! -r "$hostfile" ] || [ ! -r "$portfile" ] && echo "Error: Both files need to exist and be readable." && exit 1

echo "host,port,status"

# check open ports
 while read -r host; do 
	 while read -r port; do
		 timeout 1 bash -c "echo > /dev/tcp/$host/$port" 2>/dev/null && status="open" || status="closed"
		 echo "$echo,$port,$status"
	done < "$portfile"
done < "$hostfile"
