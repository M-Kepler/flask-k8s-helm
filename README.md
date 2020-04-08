# Simple app
This is a simple web app that returns counter on how many times page has been seen.
The application is using redis to store the count.

It also has anendpoint protected by basic http auth that will provide you with a secret string.

## Organization User (Cross Account)
If you are an AWS Organization IAM user, please run all command through `aws-vault`.

```bash
## For example

aws-vault exec deleteit -- make init && make plan
```


## How To Access EKS
First, check the current IAM user that you are using.
```bash
aws sts get-caller-identity
```

Update your `kubeconfig`
```bash
aws eks --region eu-west-2 update-kubeconfig --name demo-cluster
```

Check the result!
```bash
kubectl get nodes
```



## Terraform
All of `tfstate` are store in `S3` which created on `state-s3` this project.  


## VPC
The VPC, Subnets, Internet Gateway, NAT Gateway and Security Group are all created by Terraform.
You can change the configurations by modify the `terraform/vpc/config/dev.tfvars`.

```bash
## Go into the VPC project directory.
cd terraform/vpc

## If you wanna check the status of those resources, please run the following commands.
make init && make plan

## If you wanna deploy the changes.
make apply
``` 


## EKS
The EKS cluster and related resources are all created by Terraform.
The Terraform project contains `EKS Cluster`, `Node Group`, `IAM Roles/Policies`, `ECR` and `OIDC & IRSA`.

![arc](https://live.staticflickr.com/65535/49715657891_23558e7f5d_k.jpg)

```bash
## Go into the EKS project directory.
cd terraform/eks

## If you wanna check the status of those resources, please run the following commands.
make init && make plan

## If you wanna deploy the changes.
make apply
``` 


## EKS Add-On
On the `eks-addons` this directory, we are going to install some of the following plugins in `Ansible Playbooks`.

- Metrics Server
- Kubernetes Dashboard
- EKS Admin ServiceAccount
- ALB Ingress Controller
- Cluster Autoscaler (CA)
- Weave Scope


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


## Secrets
The secrets will be injected on the CI/CD steps as a secured environ variable.
Even though it's not a perfect way to deal with secret, it works well.
I think the perfect way is to store the secret in some kind of `secret management system` such as `SSM Parameter Store` and modify the code to take the secret on the container runtime to avoid leaking.


## Health Check
I added a health page for the Flask application which is `/health`, it will return a JSON which tell us the build version.


## CI / CD
`Travis CI` is my choice, and it's a quite simple tool to deploy a simple application.
All of the details are in `.travis.yml`.


## How to start locally
docker-compose up

## Endpoints
* GET / - path shows hello message with a counter on how many time the page has been visited.
* GET /tellmeasecret - this path requires basic http authentication and it will tell you a super secret.
