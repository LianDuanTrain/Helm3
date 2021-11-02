# Helm 3 Force Automatically Roll Deployments 
## Topics
- Why needs Force Automatically Roll Deployments？
- How to Implement Force Automatically Roll Deployments？

## Why needs Force Automatically Roll Deployments？
- Configmap is updated while Pod does not redeployment
- Demo 
  - Update a Configmap
  - `helm upgrade db . --install --namespace=qa-env --create-namespace --wait`
  - Check Deployment Resource Status 
## How to Implement Force Automatically Roll Deployments？
Add annotations in Deployment YAML
  - Monitor configmap change
    - annotations =>   checksum/config: {{ include (print $.Template.BasePath "/ configmap.yaml") . | sha256sum }}
 
  - Force Deployment redeployment each time
    - annotations => rollme: {{ randAlphaNum 5 | quote }}
- Demo 
  - Update a Configmap
  - `helm upgrade db . --install --namespace=qa-env --create-namespace --wait`  
  - Check Deployment Resource Status 


FYI:

https://codersociety.com/blog/articles/helm-best-practices
 
https://helm.sh/zh/docs/howto/charts_tips_and_tricks/

https://helm.sh/docs/chart_template_guide/function_list/#randalphanum-randalpha-randnumeric-and-randascii


https://v3.helm.sh/docs/howto/charts_tips_and_tricks/#automatically-roll-deployments



