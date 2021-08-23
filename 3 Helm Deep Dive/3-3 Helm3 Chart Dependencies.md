# Helm3 Chart Dependencies
## Topics  
- What is Chart dependencies?    
- How to add Chart dependencies?  
- Demo

## What is Chart dependencies? 
<image src= Helm3.jpg width=50%>   

In Helm, one chart may depend on any number of other charts.
These dependencies can be dynamically linked through the Chart.yaml file 
  - Helm charts store their dependencies in 'charts/'. 
  - The dependency commands operate on dependencies file.


## How to add Chart dependencies?
- Create dependencies Charts  
- Add dependencies info into root Chart.yaml
  ```
  dependencies:
    - name: my-app-back-end-springboot-app
      repository: file://../my-app-back-end-springboot-app
      version: 5.0.0
    - name: my-app-back-end-db-redis
      repository: file://../my-app-back-end-db-redis
      version: 5.0.0
  ``` 

- Run dependency commands
     - `helm dependency build CHART [flags]`    
     - `helm dependency list CHART [flags]` 
     - `helm dependency update CHART [flags]`  


##  Demo
### Create Three Charts
- `helm create my-app-back-end-db-redis`    
- `helm create my-app-back-end-springboot-app`    
- `helm create my-app-front-end-react-app` 
### Change Charts Version  

### Copy my-app v4 template files the three Charts 

- Separate my-app v4 template files to three Charts 
  - my-app-back-end-db-redis  
    - back-end-db-redis.yaml    
    - back-end-db-redis-config.yaml    
    
  - my-app-back-end-springboot-app     
    - back-end-ingress.yaml  
    - back-end-springboot-app.yaml  
    - back-end-springboot-config.yaml

  - my-app-front-end-react-app  
    - front-end-ingress.yaml     
    - front-end-react-app.yaml 

### Add Dependencies into my-app-front-end-react-app Chart.yaml
  ```
  dependencies:
    - name: my-app-back-end-springboot-app
      repository: file://../my-app-back-end-springboot-app
      version: 5.0.0
    - name: my-app-back-end-db-redis
      repository: file://../my-app-back-end-db-redis
      version: 5.0.0
  ```

###  Run dependency commands  
- `helm dependency build`   
- `helm dependency list` 

### Install Release

- Install Release
  - `helm install my-app  .  --namespace=qa-env --create-namespace --wait`
  - Add www.helm3training.com and api.helm3training.com on hosts file
### Verify Result
- Check K8s resource status via K8s Dashboard  
- Test UI Add user, List user, and Delete User
   
 


