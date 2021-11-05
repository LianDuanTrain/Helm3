# Helm 3 Force Automatically Roll Deployments 
## Topics
- Why we need Force Automatically Roll Deployments？
- How to Implement Force Automatically Roll Deployments？

## Why we need Force Automatically Roll Deployments？
- Configmap is updated while Pod does not redeployment
- Demo 
  - `helm install my-app . --install --namespace=qa-env --create-namespace --wait`
  - Check version value in ConfigMap
  - Check version value in UI
  - Change version value in Configmap
  - `helm dependency update .`
  - `helm upgrade my-app . --install --namespace=qa-env`
  - Check version value in ConfigMap
  - Check version value in UI
## How to Implement Force Automatically Roll Deployments？
Add annotations in Deployment YAML
  - Monitor configmap change
    - annotations => checksum/config: {{ include (print $.Template.BasePath "/ back-end-springboot-config.yaml") . | sha256sum }}
 
  - Force Deployment redeployment in update 
    - annotations => rollme: {{ randAlphaNum 5 | quote }}
- Demo 
  - Test annotations =>  checksum/config
    - Add annotations back-end-springboot-deployment 
    - `helm dependency update .`
    - `helm upgrade my-app .  --install --namespace=qa-env`
    - Check version value in ConfigMap
    - Check version value in UI
  - Test annotations =>   rollme
    - Change version value in Configmap
    - Add annotations back-end-springboot-deployment 
    - `helm dependency update .`
    - `helm upgrade my-app . --install --namespace=qa-env`
    - Check version value in ConfigMap
    - Check version value in UI



