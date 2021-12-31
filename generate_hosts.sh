#!/bin/sh

cat websites.txt | while read LINE; do
    if [ "${LINE:0:1}" = "#" -o -z "${LINE}" ]; then
        echo "${LINE}" >> hosts
    else
        host -4 "${LINE}" | grep -P '\d+\.\d+\.\d+\.\d+' -o -m 1 >> hosts
        sleep 0.2
    fi
done