- [How To](#how-to)
- [Test](#test)
- [Issues](#issues)

## How To

This is a Helm 3.0 Chart for deploy a Flask application and Redis.

```bash
cd chart/

## Secrets
# Secrets will store in CI/CD System as secured variables.

# 设置环境变量
export USERNAME=admin
export PASSWORD=admin
export BIGSECRET=admin

## Pre-install result.
helm install app --dry-run --debug . \
 --set secrets.username.value=$USERNAME \
 --set secrets.password.value=$PASSWORD \
 --set secrets.thebigsecret.value=$BIGSECRET

## Install to online Kubernetes cluster.
helm install app . \
 --set secrets.username.value=$USERNAME \
 --set secrets.password.value=$PASSWORD \
 --set secrets.thebigsecret.value=$BIGSECRET

## Upgrade the Chart with new version.
helm upgrade app . \
 --set secrets.username.value=$USERNAME \
 --set secrets.password.value=$PASSWORD \
 --set secrets.thebigsecret.value=$BIGSECRET

```

## Test

```sh
NAMESPACE=demo # Values.yaml 中定义的命名空间
POD_NAME=$(kubectl get po -n ${NAMESPACE} | grep Running | awk '{print $1}' | head -1)

kubectl exec $POD_NAME -n $NAMESPACE -- wget -O- -q "http://localhost:5000/" | cat

```

## Issues

To be noted, Helm 3 doesn't help us creating `namespace`, we have to create it ourselves.
Please click the link below to follow the issue.

[GitHub Issue - Helm 3 doesn't create namespace](https://github.com/helm/helm/issues/5753)

It doesn't really make sense to create `namespace` by the user, also provide `--namespace` argument.
However, it also makes sense because the user should control all of it by themselves that `namespace` is not Helm's responsibility which I believe it's right.
