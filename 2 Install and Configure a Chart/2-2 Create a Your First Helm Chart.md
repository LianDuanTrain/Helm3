# Create Your First Helm Chart
## Topics
- Create a Chart Directory
- Create a K8S Resource in Chart
- Verify Chart
##  Create a Chart Directory
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

## Create a K8S Resource in Chart 
my-app-config.yaml   
```
apiVersion: v1
kind: ConfigMap
metadata:
  name: my-app-config
data:
  username: lian
```   


## Verify Chart
- `helm lint`


