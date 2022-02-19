#!/bin/bash

cat > hosts <<\EOF
##
# Host Database
#
# localhost is used to configure the loopback interface
# when the system is booting.  Do not change this entry.
##
127.0.0.1	localhost
255.255.255.255	broadcasthost
::1             localhost
EOF

cat websites.txt | while read LINE; do
    echo "$LINE"
    if [ "${LINE:0:1}" = "#" -o -z "${LINE}" ]; then
        echo "${LINE}" >> hosts
    else
        IP=`host -4 "${LINE}" | grep -P '\d+\.\d+\.\d+\.\d+' -o -m 1`
        if [ -n "$IP" ]; then
            echo "$IP $LINE" >> hosts
        fi
        sleep 0.2
    fi
done