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


Release names are now scoped to the Namespace
The global release name scope is now reduced to the namespace scope. This has some benefits, but ignores the fact that a release may contain cluster-scoped resources, in which case resources may collide. Because the emerging prevalence of multi-tenant Kubernetes, we’re counting this as an improvement (if the cluster is properly configured, this helps avoid us stepping on each other’s toes).


https://banzaicloud.com/blog/helm3-the-good-the-bad-and-the-ugly/


There are a few commands that can help you debug.

helm lint is your go-to tool for verifying that your chart follows best practices
helm install --dry-run --debug or helm template --debug: We've seen this trick already. It's a great way to have the server render your templates, then return the resulting manifest file.
helm get manifest: This is a good way to see what templates are installed on the server.