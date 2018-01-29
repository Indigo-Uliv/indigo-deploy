#!/usr/bin/env bash

#apt-get update
#apt-get install -y apache2
dnf install -y httpd net-tools
systemctl enable httpd.service
systemctl start httpd.service
#if ! [ -L /var/www ]; then
#  rm -rf /var/www
#  ln -fs /vagrant /var/www
#fi

