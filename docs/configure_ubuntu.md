# Ubuntu 16.04 server configuration


### Create a sudo user

Indigo expects a user named indigo with sudo access

> $ sudo adduser indigo  
> $ sudo adduser indigo sudo


### Configure hostname

It is useful for Cassandra to configure properly hostnames if you plan to 
create a ring for the database

> $ sudo hostname ring-0
> $ sudo nano /etc/hostname
> $ sudo nano /etc/hosts


### Configure network interface

On virtual machines it may be useful to use another network interface so the
web server on the server can be accessed from the host. This is the 
configuration you can used to define a static IP (attached to the host-only
adapter in VirtualBox for instance)


> $ sudo nano /etc/network/interfaces

```
auto enp0s8  
iface enp0s8 inet static
  address 192.168.56.110
  netmask 255.255.255.0
  network 192.168.56.0
  broadcast 192.168.56.255
```

> $ sudo ifdown enp0s8
> $ sudo ifup enp0s8


### Configure ssh

Ansible controls node configuration over SSH. By default it assumes you are 
using SSH keys.

Add your public ssh key in ~/.ssh/authorized_keys

> $ mkdir ~/.ssh  
> $ chmod 700 ~/.ssh  
> $ nano ~/.ssh/authorized_keys
> $ chmod 600 ~/.ssh/authorized_keys


### Install Python 2.7

Python 2.7 should already be installed on ubuntu 14.04 but not on Ubuntu 16.04

> $ sudo apt install python-minimal

