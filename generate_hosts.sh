#!/bin/bash

cat websites.txt | while read LINE; do
    echo "$LINE"
    if [ "${LINE:0:1}" = "#" -o -z "${LINE}" ]; then
        echo "${LINE}" >> hosts
    else
        IP=`host -4 "${LINE}" | grep -P '\d+\.\d+\.\d+\.\d+' -o -m 1`
        echo "$IP $LINE" >> hosts
        sleep 0.2
    fi
done