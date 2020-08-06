#!/bin/bash 
set -ex
sed -i "s/demoapp/$HOSTNAME/" index.html
export privateipaddress=`tail -1 /etc/hosts|awk '{print $1}'`
sed -i "s/ipaddress/$privateipaddress/" index.html
sed -i "s/hostnameinfo/$hostinfo/" index.html
darkhttpd /root/
