# 3-8 Helm 3 Chart Troubleshooting
## Topics  
- Overview Three Tiers Application Changing
- Chart Files Change Steps
- Simulate Chart Issues
- How to Troubleshooting?

## Overview Three Tiers Application Changing
Implement Functions and Pipelines on Template Files
- my-app-back-end-db-redis
- my-app-back-end-springboot-app
- my-app-front-end-react-app
## Chart Files Change Steps
- Find a baseline on Charts
  - my-app\v5 
  - https://github.com/LianDuanTrain/Helm3/tree/master/3%20Helm%20Deep%20Dive/my-app/v5
- Create a temp chart file with the same Chart name
  - Helm create 
- Copy files
  - test yaml file 
  - _helpers.tpl
- Implement functions and pipelines on template files 
- Change test yaml file
- Change NOTES
- Compare files via winmerge
- Debug Chart files
  - --dry-run  --debug
- Helm install/upgrade  
- Verify React UI   
## Simulate Chart Issues
- Broken working Chart 
## How to Troubleshooting?
- Open React UI
- Helm test
- /etc/hosts
- Open K8s Dashboard
  - Pod
    - log
    - event 
  - Replica 
  - Service
  - Ingress
- Run a temp Busybox
- Check Minikube 

