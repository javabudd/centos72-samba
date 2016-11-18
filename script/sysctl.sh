#!/bin/bash -eux

touch /etc/sysctl.conf

echo -e "# Net\n
      net.core.rmem_max = 16777216\n
      net.core.wmem_max = 16777216\n
      net.core.somaxconn = 65536\n
      net.core.netdev_max_backlog = 16384\n
      net.ipv4.tcp_rmem = 4096 87380 16777216\n
      net.ipv4.tcp_wmem = 4096 16384 16777216\n
      net.ipv4.tcp_max_syn_backlog = 3240000\n
      net.ipv4.tcp_syncookies = 1\n
      net.ipv4.ip_local_port_range = 1024 65535\n
      net.ipv4.tcp_tw_recycle = 1\n
      net.ipv4.tcp_max_tw_buckets = 1440000\n
      net.ipv4.tcp_window_scaling = 1\n
      net.ipv4.tcp_congestion_control = cubic
" >> /etc/sysctl.conf

sysctl -p

tuned-adm profile latency-performance
