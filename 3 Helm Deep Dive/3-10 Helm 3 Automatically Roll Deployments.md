# Helm 3  Force Automatically Roll Deployments 
## Topics
- Why needs Force Automatically Roll Deployments？
- How to implement Force Automatically Roll Deployments？

## Why needs Force Automatically Roll Deployments？
- Docker container mount and read configurations item from Configmap
- Configmap is updated while Docker container does not redeployment
- Demo   
## How to implement Force Automatically Roll Deployments？
Deployment YAML
  - Monitor configmap change
    - annotations =>   checksum/config: {{ include (print $.Template.BasePath "/ configmap.yaml") . | sha256sum }}
  - Force Deployment redeployment each time
    - annotations => rollme: {{ randAlphaNum 5 | quote }}
- Demo


FYI:

https://codersociety.com/blog/articles/helm-best-practices
 
https://helm.sh/zh/docs/howto/charts_tips_and_tricks/

https://helm.sh/docs/chart_template_guide/function_list/#randalphanum-randalpha-randnumeric-and-randascii


https://v3.helm.sh/docs/howto/charts_tips_and_tricks/#automatically-roll-deployments


helm install db . --namespace=qa-env --create-namespace --wait


helm upgrade db . --install --namespace=qa-env