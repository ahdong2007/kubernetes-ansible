#!/bin/bash

exec etcdctl mk /kube-centos/network/config "{ \"Network\": \"{{ CLUSTER_CIDR }}\", \"SubnetLen\": 24, \"Backend\": { \"Type\": \"vxlan\" } }"

