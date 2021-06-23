# Upgrade & Rollback a Helm Chart in Kubernetes Cluster
Hi everybody. I'm Lian Duan. Today we are going to talk about  Upgrade & Rollback a Helm Chart in Kubernetes Cluster. 
The tpioc I'm go though in this video are 

## Topics
- Change and Install a Helm Chart 
- Create a new version of the Chart
- Upgrate a Chart to New Version
- How to Retrieve Helm Secret Content? 
- Rollback a Chart  
  
## Change and Install a Chart 
- Go Through Helm Chart
- Install Chart
  - `helm install my-app-config ./my-app-config/v1 `
- Check ConfigMap
  - `kubectl get ConfigMap`  
  - `kubectl get ConfigMap my-app-config -o yaml`  
- Check Release Info 
  - `helm list`   
  - `kubectl get secret --all-namespaces -l "owner=helm"`   

## Create a new version of the Chart
  - https://semver.org/  
- 
## Upgrate a Chart to New Version
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
  

<font size=1 >Icons made by www.freepik.com</font> 

## Today we learned,
- Install a Chart
- Install a Chart with NameSpace
- Uninstall a Chart 
---------------------------------------

Thnaks you for you witch the video. I hote it was help and it  was. do no forget to like it. 
If you want to be notified whenever a new video comes out then subscribe to my channel. 
If you have any question or something was not clear in the video. 
Please post them in a comment section below and i will try to answer.
Thank you and see you in the next video.