# Chart Test
## Topics  
- Testing Overview
- What is Chart Test?  
- Add a Back End DB Chart Test   
- Demo   

## Testing Overview
- Template testing
  - `helm lint`
  - `helm install my-app .   --dry-run --debug  --namespace=qa-env --create-namespace --wait`
- Smoke testing
  - `helm test Release Name`
- Integration testing  
## What is Chart Test?
- Validate chart works as expected
- Help the chart consumer understand what chart is supposed to do
- Location templates/tests

## Add a Back End DB Chart Test
test-redis-connection.yaml
```
apiVersion: v1
kind: Pod
metadata:
  name: {{ include "my-app-back-end-db-redis.fullname" . }}-test-connection
  labels:
      {{- include "my-app-back-end-db-redis.labels" . | nindent 4 }}-test-connection
  annotations:
    "helm.sh/hook": test    
spec:
  containers:
    - name: nc-command
      image: busybox
      command: ['nc']
      args: ['-z','-v', '{{ include "my-app-back-end-db-redis.fullname" .}}','{{ .Values.service.port}}']
  restartPolicy: Never

```
## Demo

- `helm lint`    
- `helm install my-app  .   --dry-run --debug  --namespace=qa-env --create-namespace --wait`    
- `helm test my-app --namespace=qa-env`    
