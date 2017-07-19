# kubernetes-ansible

使用方法：

1、配置ansible，确保运行ansible -i hosts all -m ping 都是成功，非root用户需要有sudo权限。

2、配置好group_vars/all.yaml 根据自己的情况修改。 
注意：如果已经有ETCD服务器，就将group_vars/all.yaml文件中填写已存在在etcd地址，并已有的ETCD服务中运行 etcdctl mkdir /kube-centos/network && etcdctl mk /kube-centos/network/config ''{ "Network": "{{ CLUSTER_CIDR }}", "SubnetLen": 24, "Backend": { "Type": "vxlan" } }'' 然后将 site.yaml 中的 etcd部分注释

注意： 要将{{ CLUSTER_CIDR }} 换成 group_var/all.yaml 文件中的子网地址。

3、配置好目录下的 hosts 文件

4、在目录下运行ansible -i hosts site.yaml

5、运行全部通过以后，需要手动对minions进行授权。方法如下：

