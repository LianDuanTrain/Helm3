# Helm 3 Chart NOTES
## Topics  
- What is Chart NOTES?
- How to test Chart NOTES?  
- Enhance Chart NOTES    
- Demo

# What is Chart NOTES?
- Instruction of chart users
- Render end of a helm install or helm upgrade
- File Location Templates/NOTES.txt

# How to test Chart NOTES?
- helm install or helm upgrade with --debug --dry-run

# Enhance Chart NOTES 
## Original Version
### Content  
<image src="Notes.jpg"/>

### Render Result 
<image src="RenderNotes.png"/>

### Enhance Version
### Content 
```
My app back end DB Redis is running. 
--------------------------------------------------
The Redis only have one Node without persistent volume. 
The Redis is used to save my app back end Spring Boot app data.
The Redis service name is {{ include "my-app-back-end-db-redis.fullname" . }}
The Redis port is {{.Values.service.port}}
--------------------------------------------------
Get the Redis URL by running these commands:
{{-  if contains "NodePort" .Values.service.type }}
  export NODE_PORT=$(kubectl get --namespace {{ .Release.Namespace }} -o jsonpath="{.spec.ports[0].nodePort}" services {{ include "my-app-back-end-db-redis.fullname" . }})
  export NODE_IP=$(kubectl get nodes --namespace {{ .Release.Namespace }} -o jsonpath="{.items[0].status.addresses[0].address}")
  echo http://$NODE_IP:$NODE_PORT
{{- else }}
  Please check NodePort configuration in values.yaml
{{- end }}
```
### Render Result
<image src="RenderEhance.jpg"/>


## Demo

  - `helm install my-app .  --dry-run  --debug --namespace=qa-env --create-namespace --wait`  
  - `helm install my-app . --namespace=qa-env --create-namespace --wait`  
  - `helm uninstall my-app   --namespace=qa-env`   
