
# Upgrade & Rollback a Helm Chart in Kubernetes Cluster
## Topics
- Install a Chart
- Upgrate a Chart 
- How to Retrieve Helm Secret Content? 
- Rollback a Chart  
  
## Install a Chart 
- Go Through Helm Chart
- Install Chart
  - `helm install my-app-config ./my-app-config/v1 `
- Check ConfigMap
  - `kubectl get ConfigMap`  
  - `kubectl get ConfigMap my-app-config -o yaml`  
- Check Release Info 
  - `helm list`   
  - `kubectl get secret --all-namespaces -l "owner=helm"`   


## Upgrade a Chart 
- Go Through Helm Chart
  - https://semver.org/
- Upgrade Chart
  - `helm upgrade my-app-config ./my-app-config/v2`   
- Check ConfigMap
  - `kubectl get ConfigMap`  
  - `kubectl get ConfigMap my-app-config -o yaml`  
- Check Release Info 
  - `helm list`   
  - `kubectl get secret --all-namespaces -l "owner=helm"`   


# How to Retrieve Helm Secret Content?   
```
kubectl get secret sh.helm.release.v1.my-app-config.v2 -o jsonpath="{ .data.release }" | base64 -d | base64 -d | gunzip -c | jq '.chart.templates[].data' | tr -d '"' | base64 -d

```

## Rollback a Chart 
- Get Release REVISION
  - `helm history my-app-config`
- Rollback
  - `helm rollback my-app-config 1`
- Check History
  - `helm history my-app-config`

    