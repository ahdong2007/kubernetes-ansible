# kubernetes ansible

# 使用方法：

 1、配置ansible，确保运行ansible -i hosts all -m ping 都是成功，非root用户需要有sudo权限。

 2、配置好group_vars/all.yaml 根据自己的情况修改。 

 注意：如果已经有ETCD服务器，在group_vars/all.yaml中ETCD_INSTALL配置为no， 在ETCD_SERVER_IP 配置已有的ETCD服务IP

 3、配置好目录下的 hosts 文件

 4、在目录下运行ansible-playbook -i hosts site.yaml

 5、检查集群状态

    1、kubectl get componentstatuses
   
    2、kubectl get nodes

enjoy!!!
