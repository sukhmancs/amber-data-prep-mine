#!/bin/bash

num_lines=$1

# check $num_lines is set
if [[ -z "$num_lines" ]]; then
    echo "No argument provided. Please provide the number of URLs to download."
    exit 1
fi

count=0
# wget 'https://data.together.xyz/redpajama-data-1T/v1.0.0/urls.txt'
while read line; do
    if (( count >= num_lines )); then
        break
    fi
    
    dload_loc=${line#https://data.together.xyz/redpajama-data-1T/v1.0.0/}
    mkdir -p $(dirname $dload_loc)
    wget -nc "$line" -O "$dload_loc"
    
    ((count++))
done < urls.txt
