[![Build Status](https://travis-ci.org/davidh83110/flask-k8s.svg?branch=master)](https://travis-ci.org/davidh83110/flask-k8s)

# Simple app
This is a simple web app that returns counter on how many times page has been seen.
The application is using redis to store the count.

It also has anendpoint protected by basic http auth that will provide you with a secret string.


## Organization User (Cross Account)
If you are an AWS Organization IAM user, please run commands related to AWS through `aws-vault`.

```bash
## For example

aws-vault exec deleteit -- make init && make plan
```


## How To Access EKS
EKS uses IAM to provide authentication to your Kubernetes cluster, via the `aws eks get-token` or `AWS IAM Authenticator fro Kubernetes`.
But it still relies on the RBAC which native on Kubernetes.  

To follow the best practices of EKS, let's stick to use IAM user to access the cluster. 
After the user created, we will also have to add it on the ConfigMap by `kubectl edit configmap/aws-auth -n kube-system`.
Check the official documentation below. 

[AWS - Managing Users or IAM Roles for your Cluster](https://docs.aws.amazon.com/eks/latest/userguide/add-user-role.html) 

Following the steps to access this EKS cluster and before we start, please make sure you already added the `Access / Secret Keys` in your `~/.aws/credentials` and corresponding profile on `~/.aws/config`.

A. Check the current IAM user that you are using.
```bash
aws sts get-caller-identity
```

B. Update your `kubeconfig`
```bash
aws eks --region eu-west-2 update-kubeconfig --name demo-cluster
```

C. Check the result!
```bash
kubectl get nodes
```

### Bastion
SSH with keychain to bastion instance to access the internal resources.


## Application
### Flask Ingress
We can get the ALB address by `kubectl`.
```bash
kubectl get ingress -n demo -o=jsonpath="{..status.loadBalancer.ingress[0].hostname}"
```

### All Resources About App
The Flask and Redis related resources are all in `demo` namespace.
```bash
kubectl get all -n demo
```

### Secrets
The secrets will be injected on the CI/CD steps as a secured environ variable.
Even though it's not a perfect way to deal with secret, it works well.
I think the perfect way is to store the secret in some kind of `secret management system` such as `SSM Parameter Store` and modify the code to retrieve the secrets on the container runtime to avoid leaking.


## Helm Chart
We are using Helm to deploy the application and `--set` to specify the variable.
Of course, you can also use `-f values.yaml` instead.

This Helm Chart contains `Flask Deployment / Service / Ingress / Secrets` and `Redis Deployment / Service` as well as a `namespace`.


```bash
## First time to install the chart.
helm install app ./chart \
    --set deployment.flask.image.repository=$ACCOUNT_ID.dkr.ecr.eu-west-2.amazonaws.com/flask-app \
    --set deployment.flask.image.tag=$DEPLOY_VERSION \
    --set secrets.username.value=$USERNAME \
    --set secrets.password.value=$PASSWORD \ 
    --set secrets.thebigsecret.value=$BIGSECRET \
    --set deploy.version=$DEPLOY_VERSION

## To Upgrade the chart (deploy/release)
helm upgrade app ./chart \
    --set deployment.flask.image.repository=$ACCOUNT_ID.dkr.ecr.eu-west-2.amazonaws.com/flask-app \
    --set deployment.flask.image.tag=$DEPLOY_VERSION \
    --set secrets.username.value=$USERNAME \
    --set secrets.password.value=$PASSWORD \ 
    --set secrets.thebigsecret.value=$BIGSECRET \
    --set deploy.version=$DEPLOY_VERSION

## If you just want to check the result first.
helm upgrade app ./chart ...(skip) --dry-run --debug
```


## Terraform
All of `tfstate` are store in `S3` which created on `state-s3` this project.  


### VPC
The VPC, Subnets, Internet Gateway, NAT Gateway and Security Group are all created by Terraform.
You can change the configurations by modify the `terraform/vpc/config/dev.tfvars`. For organization user, remember to use `aws-vault`.

![VPC](https://live.staticflickr.com/65535/49751801831_97769ee6fa_k.jpg)

```bash
## Go into the VPC project directory.
cd terraform/vpc

## If you wanna check the status of those resources, please run the following commands.
make init && make plan

## If you wanna deploy the changes.
make apply
``` 


### EKS
The EKS cluster and related resources are all created by Terraform.
The Terraform project contains `EKS Cluster`, `Node Group`, `IAM Roles/Policies`, `ECR` and `OIDC & IRSA`.

![arc](https://live.staticflickr.com/65535/49751615113_ff81d31f5c_k.jpg)

```bash
## Go into the EKS project directory.
cd terraform/eks

## If you wanna check the status of those resources, please run the following commands.
make init && make plan

## If you wanna deploy the changes.
make apply
``` 


## EKS Add-On (Ansible Playbooks)
On the `eks-addons` this directory, we are going to install some of the following plugins in `Ansible Playbooks`.

- Metrics Server
- Kubernetes Dashboard
- EKS Admin ServiceAccount
- ALB Ingress Controller
- Cluster Autoscaler (CA)


## CI / CD
`Travis CI` is my choice, and it's a quite simple tool to deploy a simple application.
All of the details are in `.travis.yml`.


## How to start locally
docker-compose up

## Endpoints
* GET / - path shows hello message with a counter on how many time the page has been visited.
* GET /spersecret - this path requires basic http authentication and it will tell you a super secret.
* GET /health - health check page.
