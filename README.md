# kubernetes-ansible

使用方法：

1、配置ansible，确保运行ansible -i hosts all -m ping 都是成功，非root用户需要有sudo权限。

2、配置好group_vars/all.yaml 根据自己的情况修改。 

注意：如果已经有ETCD服务器，在group_vars/all.yaml中ETCD_INSTALL配置为no， 在ETCD_SERVER_IP 配置已有的ETCD服务IP

     kubernetes已更新最新版本v1.7.3

3、配置好目录下的 hosts 文件

4、在目录下运行ansible -i hosts site.yaml

5、运行全部通过以后，需要手动对minions进行授权。方法如下：

    1、kubectl get csr
   
    2、kubectl certificate approve csr-wgvgb #csr-wgvgb是kubectl get csr 中的name
   
    3、kubectl certificate approve csr-z6t53

6、检查集群状态

    1、kubectl get componentstatuses
   
    2、kubectl get nodes

即便如此，我们还并没有真正的部署完kubernets。 还需要部署kube-dns、kube-dashboard、ingress不过这些东西，将比之前的安装就简单多了。

安装kube-dns:

1、sed -i 's/__PILLAR__DNS__DOMAIN__/"你的域名（必须与group_vars/all.yaml中配置的一致）"/g' kubedns-controller.yaml 

2、kubectl create -f kubedns-controller.yaml kubedns-svc.yaml kubedns-cm.yaml kubedns-sa.yaml 

3、kubectl get pods --all-namespaces

安装kube-dashboard:

1、kubectl create -f dashboard-service.yaml dashborad-controller.yaml dashboard-rbac.yaml 

2、kubectl create clusterrolebinding  add-on-cluster-admin --clusterrole=cluster-admin --serviceaccount=kube-system:default

3、kubectl proxy --accept-hosts='.*' --address="对外访问地址,例如：114.220.3.4" 

4、打开浏览器输入 http://114.220.3.4:8001/ui 即可呈现kubenetes dashboard

enjoy!!!



