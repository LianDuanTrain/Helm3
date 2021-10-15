# 3-8 Helm 3 Chart Troubleshooting
## Topics  
- Overview Three Tiers Application Changing
- Chart Files Change Steps
- Simulate Chart Issues
- Troubleshooting

## Overview Three Tiers Application Changing
Implement Functions and Pipelines on Template Files
- my-app-back-end-db-redis
- my-app-back-end-springboot-app
- my-app-front-end-react-app
## Chart Files Change Steps
- Create a baseline on Chart
- Create a temp chart file with the same name
- Copy files
  - test file
  - _helpers.tpl
- Implement functions and pipelines on Template Files 
- Change test file
- Change NOTES
- Complear files via winmerge
- --dry-run  --debug
- Helm install/upgrade  
## Simulate Chart Issues
- Broken working Chart 
## Troubleshooting
- Helm test
- /etc/hosts
- Open K8s Dashboard
  - pod
    - log
    - event 
  - replica 
  - Service
  - Ingress
- Run a temp Busybox

