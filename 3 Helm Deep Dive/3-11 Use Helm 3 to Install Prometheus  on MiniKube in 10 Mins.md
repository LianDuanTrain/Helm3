# Use Helm 3 to Install Prometheus Stack on Minikube in 10 Mins
## Topics
- What is Prometheus？
- How to find Prometheus Chart？
- Use Helm 3 to Install Prometheus Stack

## What is Prometheus？
Prometheus is an open-source system monitoring and alerting toolkit.  
<img src='https://prometheus.io/assets/architecture.png' >  

## How to find Prometheus Chart？
Search and find Prometheus Chart on https://artifacthub.io/

## Use Helm 3 to Install Prometheus Stack
### Add Helm Repo 
```
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

```
### Install Prometheus Stack
- prometheus-community/kube-state-metrics
- prometheus-community/prometheus-node-exporter
- grafana/grafana
  
https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack

```
helm install prometheus prometheus-community/kube-prometheus-stack --namespace=prometheus --create-namespace --wait
```

### Add Port Forward
- Prometheus node Exporter      
`kubectl port-forward service/prometheus-prometheus-node-exporter 9100   --namespace=prometheus`        
- Prometheus UI    
`kubectl port-forward service/prometheus-operated  9090 --namespace=prometheus`  
- Prometheus Grafana   
`kubectl port-forward deployment/prometheus-grafana 3000 --namespace=prometheus`

### Verify

- Prometheus UI   
  - PromQL   
        ```
        (node_memory_MemTotal_bytes --(node_memory_MemFree_bytes + node_memory_Cached_bytes +node_memory_Buffers_bytes)) / node_memory_MemTotal_bytes * 100
        ```

- Prometheus node exporter
          
- Grafana UI

## Summary
- Prometheus is an open-source system monitoring and alerting toolkit.    
- Find Prometheus Chart on https://artifacthub.io/   
- Install Prometheus Stack via Helm 3  
  - Prometheus node exporter  
  - Prometheus UI  
  - Grafana UI  






