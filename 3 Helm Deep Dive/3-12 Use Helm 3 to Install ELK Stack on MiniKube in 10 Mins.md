# Use Helm 3 to Install ELK Stack on MiniKube in 10 Mins
## Topics
- What is ELK Stack?
- Find ELK Charts on artifacthub.io
- Use Helm 3 to Install ELK Stack

## What is ELK Stack?
Elasticsearch, Kibana, Beats, and Logstash (also known as the ELK Stack).   
<img src='https://static-www.elastic.co/v3/assets/bltefdd0b53724fa2ce/blt6021954e32bc5527/5bbc9f45560fdc4d0c8e6576/the-elastic-stack-thumb.png' >  

## Find ELK Charts on artifacthub.io
- Search and find Elasticsearch Chart on https://artifacthub.io/
- Github https://github.com/elastic/helm-charts

## Use Helm 3 to Install ELK Stack
### Configure Minikube
```
minikube start
minikube addons enable default-storageclass
minikube addons enable storage-provisioner
minikube config set cpus 4
minikube config set memory 14384

```

### Add Helm Repo 
```
helm repo add elastic https://helm.elastic.co
helm repo update  
```

### Create an Elasticsearch Value YAML File 
YAML File is based on https://github.com/elastic/helm-charts/blob/main/elasticsearch/examples/minikube/values.yaml 

```
# Shrink default JVM heap.
esJavaOpts: "-Xmx256m -Xms256m"
memory: "1024M"
```  
https://raw.githubusercontent.com/LianDuanTrain/Helm3/master/3%20Helm%20Deep%20Dive/elasticsearch/minikube/values.yaml

### Install ELK Stack  
- Elasticsearch    
  ```
  helm install elasticsearch elastic/elasticsearch  -f values.yaml --namespace=elk  --create-namespace --wait
  
  kubectl port-forward service/elasticsearch-master 9200  --namespace=elk
  ```  
- Kibana  
  ```  
  helm install kibana elastic/kibana --namespace=elk --wait
  kubectl port-forward deployment/kibana-kibana 5601 --namespace=elk  
  ```
- Filebeat  
  ```
  helm install filebeat elastic/filebeat --namespace=elk --wait
  ```  


### Verify ELK Stack
- Create an Index
  - Management=>kibana=>indexPatterns
- Search Index Aata 
  - Analytics=>Discover

## Summary
- ELK Stack
- Find ELK Chart on artifacthub.io
- Use Helm 3 to Install Elasticsearch, Kibana, Filebeat.






