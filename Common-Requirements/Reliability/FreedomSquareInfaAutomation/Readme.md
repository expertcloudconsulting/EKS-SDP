This Folder contains base IaC scripts for commissioning the nodes required for kubernetes cluster using Terraform for Dev environment.
It commissions nodes for Control-Plane Cluster nodes, worker nodes & External etcd-cluster nodes. These nodes are then updated with the configuration with ansible for specific roles, sync policies, certificate exchange and file updates.
