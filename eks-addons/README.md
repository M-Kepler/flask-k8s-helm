## EKS Add-ONs

There are some add-ons for EKS that would be useful and they are also some simple ansible playbooks. 


## Metrics Server & Kubernetes-Dashboard

```bash

ansible-playbook install_metrics_server.yml
ansible-playbook install_dashboard.yml

## ServiceAccount for Dashboard.
ansible-playbook eks_admin_service_account.yml

```


## Cluster Autoscaler (CA)
```bash

ansible-playbook install_cluster_autoscaler.yml

```


## ALB Ingress Controller

```bash

ansible-playbook install_alb_ingress_controller.yml

```


## Weave Scope - Monitoring, Visualisation Tool

```bash
ansible-playbook install_weave_scope.yml

```
