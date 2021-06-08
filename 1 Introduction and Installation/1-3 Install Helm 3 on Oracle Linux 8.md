# Install Helm 3 on Oracle Linux 8
## Topics
-  How to Find Compatible Helm 3 Version?   
-  Hands on Demo 
   -  Install Helm 3 
   -  Add and update Helm Repos
-  Check Helm Client   
## How to Find Compatible Helm 3 Version? 
- Check Kubernetes Version  
`kubectl version`  
- Find Version of Helm is compatible with your Kubernetes cluster   
https://helm.sh/docs/topics/version_skew/  
https://github.com/helm/helm/releases  

## Hands on Demo 
### Install Helm 3
- Download   
  `wget https://get.helm.sh/helm-v3.5.4-linux-amd64.tar.gz`
- Unzip
  `tar -zxvf helm-v3.X.X`  
- Move to /usr/local/bin    
`sudo mv linux-amd64/helm /usr/local/bin/helm`

### Helm Repo
#### Add Helm Repo
```
helm repo add  stable     https://charts.helm.sh/stable
helm repo add  elastic    https://helm.elastic.co
helm repo add  gitlab     https://charts.gitlab.io
helm repo add  harbor     https://helm.goharbor.io
helm repo add  bitnami    https://charts.bitnami.com/bitnami
helm repo add  incubator  https://charts.helm.sh/incubator

```
#### Update Repo  
- `helm repo update` 
- `helm repo list`  

## Check Helm Client
- `helm help`  
 
- `helm search repo nginx`  

<font size=1 >Icons made by www.freepik.com</font> 

