# Install & Uninstall a Helm Chart in Kubernetes Cluster
## Topics
- Install a Chart
- Install a Chart with NameSpace
- Uninstall a Chart  
  
## Install a Chart 
- Install Chart
  - `helm install my-app-config ./my-app-config/ `
- Check ConfigMap
  - `kubectl get ConfigMap`  
  - `kubectl get ConfigMap my-app-config -o yaml`  
- Check Release Info 
  - `helm list`   
  - `kubectl get secret --all-namespaces -l "owner=helm"`   


## Install a Chart with NameSpace
- `helm install my-app-config ./my-app-config/ --namespace=qa-env --create-namespace --wait` 
- Check ConfigMap
   - `kubectl get ConfigMap --namespace=qa-env`
   - `kubectl get ConfigMap my-app-config -o yaml --namespace=qa-env`
- `helm list --namespace=qa-env` 

## Uninstall a Chart 
- `helm uninstall my-app-config`   
- `kubectl get ConfigMap`   
- `helm uninstall my-app-config --namespace=qa-env`   
- `kubectl get ConfigMap --namespace=qa-env`     