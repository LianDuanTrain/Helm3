
# Upgrade a Helm Chart in Kubernetes Cluster
## Topics
- Change Version of a Helm Chart 
- Install the Helm Chart 
- Create a New Version of the Helm Chart
- Upgrade the Helm Chart to New Version

## Change Version of a Helm Chart  
- Change version and appVersion in Chart.yaml  
- Add version in my-app-config.yaml  

## Install the Helm Chart     
- Install Chart
  - `helm install my-app-config ./my-app-config/v1 `
- Check ConfigMap
  - `kubectl get ConfigMap`  
  - `kubectl get ConfigMap my-app-config -o yaml`  
- Check Release Info 
  - `helm list`   
  - `kubectl get secret --all-namespaces -l "owner=helm"`   

## Create a New Version of the Helm Chart
  - https://semver.org/  
## Upgrade the Helm Chart to New Version
- Upgrade Chart
  - `helm upgrade my-app-config ./my-app-config/v2`   
- Check ConfigMap
  - `kubectl get ConfigMap`  
  - `kubectl get ConfigMap my-app-config -o yaml`  
- Check Release Info 
  - `helm list`   
  - `kubectl get secret --all-namespaces -l "owner=helm"`   



<font size=1 >Icons made by www.freepik.com</font> 

    