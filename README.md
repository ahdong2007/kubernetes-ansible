# Deploy Kubernetes with ansible

This playbook helps you to set up a Kubernetes cluster on a number of Fedora or RHEL/CentOS machines.
Doesn't matter how or where or whatever. Real hardware, VMs, honey badger don't care.

# Requirements
1、To deploy the Kubernetes environment you will need standard Fedora or RHEL/CentOS system and have root privileges.

2、You will need at least 2 (virtual) machines. One will be configured as the Kubernetes master and the remaining node(s) can be configured as minions or deployment nodes

3、There is currently no support for multiple master Because it involves generating kubernetes key problem, has not yet been resolved.

# Setup
1、Configure the host ip and hostname in the inventory file.

2、Configure the cluster option in the group_vars/all.yaml file. If the ETCD service already exists, set the etcd_install option to no.
And fill in the etcd_server_ip option already exists ETCD service address.

# Run
ansible-playbook -i hosts site.yaml

# Check
1、get nodes status

    #kubectl get nodes

2、get cluster status

    #kubectl get componentstatuses

# At last
If you encounter any problems during use, please let me know that I will do my best to help you.
