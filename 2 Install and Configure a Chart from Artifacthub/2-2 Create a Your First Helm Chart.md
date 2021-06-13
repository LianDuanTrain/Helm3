# Create a Your First Helm Chart

##  Creates a Chart directory
 - `helm create my-app-config`
```
my-app-config
├── charts
├── Chart.yaml         
├── templates           
│   ├── deployment.yaml
│   ├── _helpers.tpl
│   ├── hpa.yaml
│   ├── ingress.yaml
│   ├── NOTES.txt       
│   ├── serviceaccount.yaml
│   ├── service.yaml
│   └── tests
│       └── test-connection.yaml
└── values.yaml        

```

## Creates a K8S resource in Chart 
my-app-config.yaml   
```
 apiVersion: v1
kind: ConfigMap
metadata:
  name: my-app-config
data:
  username: lian
```   
- Check ConfigMap
   - `kubectl get ConfigMap`
   - `kubectl get ConfigMap my-app-config -o yaml`
- Get Release List 
   - `helm list` 

## Verify Chart
- `helm lint`



## Install a Chart 
- helm install my-app-config ./my-app-config/   

## Install a Chart with NameSpace
- `helm install my-app-config ./my-app-config/ --namespace=qa-env --create-namespace --wait` 
- Check ConfigMap
   - `kubectl get ConfigMap --namespace=qa-env`
   - `kubectl get ConfigMap my-app-config -o yaml --namespace=qa-env`
- `helm list --namespace=qa-env` 

## Uninstall a Chart 
- `helm uninstall my-app-config`   
- `kubectl get ConfigMap`   
- `helm uninstall my-app-config --namespace=qa-env`   
- `kubectl get ConfigMap --namespace=qa-env`   
