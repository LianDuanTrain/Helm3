# Implement Functions and Pipelines on Template Files
## Topics  
- Analysis Template Files  
- Implement Functions and Pipelines to Template Files   
- Add Values in Value.yaml   
- Verify and Install Back End DB Chart  

## Analysis Template Files
ConfigMap Resource   
- metadata
   - name
   - labels
  
Deployment Resource  
- metadata
   - name
   - labels
- spec
  - replicas 
  - selector = > matchLabels  
  - template  
     - metadata   = > labels
     - spec   = > containers

Service Resource  
- metadata
   - name
   - labels   
- spec  
   - type    
   - ports  
   - selector      

## Implement Functions and Pipelines to Template Files 

<image src="Start V5  my-app-back-end-db-redis.jpg">

## Add Values in Value.yaml  
- replicaCount
- image  
- nameOverride  
- fullnameOverride   
- service  
  - type  
  - port  
- resources   
- redis
  - port

## Verify and Install Back End DB Chart  
- `helm lint`   
- `helm install my-app  .   --dry-run --debug  --namespace=qa-env --create-namespace --wait`   
- `helm install my-app  .  --namespace=qa-env --create-namespace --wait`  
- `helm get manifest  my-app  --namespace=qa-env`  
```
kubectl get secret --all-namespaces -l "owner=helm" 

kubectl get secret sh.helm.release.v1.my-app.v1 -o jsonpath="{ .data.release }" | base64 -d | base64 -d | gunzip -c | jq '.chart.templates[].data' | tr -d '"' | base64 -d

```