
# Rollback a Helm Chart Release in Kubernetes Cluster
## Topics

- Rollback a Helm Chart Release   
- How to Retrieve Helm Chart Release Content?  

## Rollback a Helm Chart Release  
- Check Release Info 
  - `helm list`   
- Get Release REVISION
  - `helm history my-app-config`
- Rollback
  - 'helm rollback <RELEASE> [REVISION] [flags]'`
  - `helm rollback my-app-config 1`
- Check History
  - `helm history my-app-config`
- How to Roll Back Using kubectl?
```
kubectl rollout undo deployment/[release]
kubectl rollout undo deployment/[release] --to-revision=[revision]
```
# How to Retrieve Helm Chart Release Content? 
- `kubectl get secret --all-namespaces -l "owner=helm"`   
```
kubectl get secret sh.helm.release.v1.my-app-config.v2 -o jsonpath="{ .data.release }" | base64 -d | base64 -d | gunzip -c | jq '.chart.templates[].data' | tr -d '"' | base64 -d

```
<font size=1 >Icons made by www.freepik.com</font> 

    