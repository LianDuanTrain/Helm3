# Value
## Topics  
- What is Value?    
- Value Types  
- Demo
  - Use values.yaml
  - Overwrite Values 
## What is Value?  
  - Values are in values.yaml file.
  - Values are used by templates.
  - Allow  overwrite  
  - Format {{Value name}}  

## Value Types
- Built-in Objects (https://helm.sh/docs/chart_template_guide/builtin_objects/)     
  - Release.Name  
  - Release.Namespace 
  - Release.IsUpgrade 
  - Release.IsInstall 
  - Release.Revision 
  - Release.Service  
- Customer Values
  - values.yaml 
  - helm install or helm upgrade  -f  *.yaml 
  - helm install or helm upgrade  --set or --set-string 


##  Demo
### Use values.yaml
 - Update data in values.yaml  
 - Add values data in  my-app-config.yaml
 - `helm install myRelease . --dry-run --debug`
 - `helm install myRelease . `
 - `helm install myrelease . `
 - `kubectl get ConfigMap`
 - `kubectl get ConfigMap myrelease-my-app-config -o yaml`
 - `helm delete myrelease`
### Overwrite Values  
 - YAML File   
    - `helm install myrelease . -f myvalues.yaml`
    - `kubectl get ConfigMap`
    - `kubectl get ConfigMap myrelease-my-app-config -o yaml`  
    - `helm delete myrelease`


 - --set     
    - `helm install myrelease . --dry-run --debug --set config.userName=Peppa --set config.version=v3.2`   
    - `helm install myrelease . --set config.userName=Peppa --set config.version=v3.2`   
    - `kubectl get ConfigMap`   
    - `kubectl get ConfigMap myrelease-my-app-config -o yaml`    
   
 


