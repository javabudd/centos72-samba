#!/bin/bash -eux

yum -y install samba-client samba-common cifs-utils

sed -i '/Network-Related Options/i socket options = TCP_NODELAY IPTOS_LOWDELAY SO_RCVBUF=65536 SO_SNDBUF=65536\nlog level = 1' /etc/samba/smb.conf
