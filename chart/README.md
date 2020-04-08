## How To

This is a Helm 3.0 Chart for deploy a Flask application and Redis.

```bash

## Pre-install result.
helm install app --dry-run --debug . \
 --set secrets.username.value=$USERNAME \
 --set secrets.password.valu=$PASSWORD \
 --set secrets.thebigsecret.value=$BIGSECRET

## Install to online Kubernetes cluster.
helm install app . \
 --set secrets.username.value=$USERNAME \
 --set secrets.password.valu=$PASSWORD \
 --set secrets.thebigsecret.value=$BIGSECRET

## Upgrade the Chart with new version.
helm upgrade app . \
 --set secrets.username.value=$USERNAME \
 --set secrets.password.valu=$PASSWORD \
 --set secrets.thebigsecret.value=$BIGSECRET

```

## Secrets

Secrets will store in CI/CD System as secured variables.


## Issues

To be noted, Helm 3 doesn't help us creating `namespace`, we have to create it ourselves.  
Please click the link below to follow the issue.
   
[GitHub Issue - Helm 3 doesn't create namespace](https://github.com/helm/helm/issues/5753)

It doesn't really make sense to create `namespace` by the user, also provide `--namespace` argument.  
However, it also makes sense because the user should control all of it by themselves that `namespace` is not Helm's responsibility which I believe it's right.