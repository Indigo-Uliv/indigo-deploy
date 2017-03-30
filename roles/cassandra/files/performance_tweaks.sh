#!/bin/bash

echo "cassandra - memlock unlimited" >> /etc/security/limits.conf
echo "cassandra - nofile 100000" >> /etc/security/limits.conf
echo "cassandra - nproc 32768" >> /etc/security/limits.conf
echo "cassandra - as unlimited" >> /etc/security/limits.conf
echo "* hard    nofile  65532" >> /etc/security/limits.conf
echo "* soft    nofile  65532" >> /etc/security/limits.conf
echo "root - memlock unlimited" >> /etc/security/limits.conf
echo "root - nofile 100000" >> /etc/security/limits.conf
echo "root - nproc 32768" >> /etc/security/limits.conf
echo "root - as unlimited" >> /etc/security/limits.conf
echo "net.ipv4.tcp_tw_reuse = 1" >> /etc/sysctl.conf
echo "vm.overcommit_memory = 1" >> /etc/sysctl.conf
echo "vm.zone_reclaim_mode = 0" >> /etc/sysctl.conf
echo "vm.max_map_count = 131072" >> /etc/sysctl.conf

sysctl -p
