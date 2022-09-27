# Install and Configure Helm 3 with Minikube on Windows 11
## Topics
-  Precondition Check
-  Install/Upgrade Chocolatey
-  Install Helm 3
-  Configure and Verify Helm 3
## Precondition Check
- My demo box is on Microsoft Windows 11 Pro (10.0.22000).
    - `systeminfo` 
    - [<image src="./images/windows11.jpg" width="40%">] 
- Check Minikube Kubernetes Version  
    - `kubectl version`   
    - [<image src="./images/kversion.jpg" width="50%">] 

## Install/Upgrade Chocolatey
Chocolatey is used to install Helm 3   
- Install Chocolatey
 - Open CMD as admin, and run the below command       
``` 
"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "[System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
```
 - https://docs.chocolatey.org/en-us/choco/setup
- Upgrade Chocolatey
   - `choco upgrade chocolatey`   
[<image src="./images/upgrate.jpg" width="50%">] 

## Install Helm 3
   
### Compatible Check


- Find Version of Helm is compatible with Kubernetes cluster 
    - https://helm.sh/docs/topics/version_skew/  
    - [<image src="./images/compatible.jpg" width="50%">]
    - `choco search kubernetes-helm`  
### Install Helm 3
  - `choco install kubernetes-helm`  
  - `helm version`
  - [<image src="./images/helmversion.jpg" width="50%">]   
### How to Install Specific Helm 3 Version? 
  - `choco search kubernetes-helm --all`
  - `choco install kubernetes-helm -version X.Y.Z`
   
## Configure and Verify Helm 3
### Add Helm Repo
```
helm repo add  stable     https://charts.helm.sh/stable
helm repo add  elastic    https://helm.elastic.co
helm repo add  gitlab     https://charts.gitlab.io
helm repo add  harbor     https://helm.goharbor.io
helm repo add  bitnami    https://charts.bitnami.com/bitnami
helm repo add  incubator  https://charts.helm.sh/incubator
```
### Update Helm Repo  
- `helm repo update`   

### Verify Helm 3
- `helm search repo nginx`  


