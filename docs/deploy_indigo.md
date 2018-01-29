# Deploy 

Indigo is deployed with Ansible, from a guest to a number of hosts. Ansible 
controls node configuration over SSH to connect to servers and run the 
configured tasks, you need to have an ssh access from the guest to the hosts. 
By default it assumes you are using SSH keys.



### SSH configuration on the guest


##### Generating an SSH key

> $ ssh-keygen -t rsa -b 4096 -C "your_email@example.com"


##### Edit Config file

> $ nano ~/.ssh/config

```
Host ring-*
User indigo
Hostname %h
Compression yes
PreferredAuthentications publickey
IdentityFile ~/.ssh/id_rsa
```


### VirtualBox Configuration

If you want to experiment on a local virtual machine (VM) using virtualbox for
instance, this is the usual configuration I'm using:

* Create a Host-ony Network in the VirtualBox settings (vboxnet0)
   * IPv4 address 192.168.56.1
* Basic configuration with enough memory, 1 hard disk
* Adapter 1 attached to NAT
* Adapter 2 attached to Host-only adapter (vboxnet0) so Host and Guest can see 
each other on the 192.168.56.x network. 


### Hosts configuration

See configure_distrib.md for a more precise description of the steps for 
different guest.


### Ansible Configuration


* Create a host file for ansible (_./inventory/staging_ for instance)


```
[cassandra_nodes]
ring-0 node_ip=192.168.56.110 seed=true
ring-1 node_ip=192.168.56.111 seed=true

[all_cassandra_nodes:children]
cassandra_nodes

[indigo-webservers]
ring-0
ring-1
```


* Group variables in _./group_vars/all_

  * _**cluster_name**_: the cluster name that will be used by all guests in 
  Cassandra ring.
  * _**num_tokens**_: number of tokens that a given node will service.
  * _**install_user**_: username to install everything
  


* Guest variables (This can also be defined in a file _./host_vars/hostname_)

  * _**node_ip**_: the ip of the node the guest will be using for
Cassandra.
  * _**seed**_: a boolean to determine if the node is a Cassandra seed
  
* You can choose if you want to activate the HTTPs mode in the 
_./webservers.yml_ file, with the **_https_mode_** variable.



### Install everything

- Install everything

ansible-playbook full.yml -i inventory/staging --ask-become-pass

- Install Datastax Enterprise for Cassandra

ansible-playbook databases.yml -i inventory/staging --ask-become-pass

- Only install Indigo without Cassandra

ansible-playbook indigo.yml -i inventory/staging --ask-become-pass



