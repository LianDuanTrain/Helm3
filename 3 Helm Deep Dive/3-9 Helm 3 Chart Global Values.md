# Helm 3 Chart Global Values
## Topics  
- How to handle Values cross Charts?
- What are Global Values?
- Which values are should be Global Values?
- How to add Global Values in Three Tiers Application?
- Demo
 
## How to handle Values cross Charts?
- Challenge
  - A subchart can never explicitly depend on its parent chart
  - A subchart cannot access the values of its parent

- Solution
  - A parent chart can override values for subcharts
  - Global Values 
## What are Global Values?
- Accesse any chart or subchart by exactly the same name  
- values.yaml file  
- Type Values.global  
- Support Overwrite 

## Which values are should be Global Values?
### Analysis Three Tiers Application
- DB
  - Redis - One Node 
  - Service Name: back-end-db-redis
  - YAML Files
    - back-end-db-redis-config.yaml
    - back-end-db-redis-deployment.yaml
    - back-end-db-redis-service.yaml
    - test
      - back-end-db-redis-test-connection.yaml 
- Back-End 
  - Spring Boot as restful web services
  - URL: api.helm3training.com 
  - YAML Files
    - back-end-springboot-config.yaml
    - back-end-springboot-deployment.yaml
    - back-end-springboot-service.yaml
    - back-end-springboot-ingress.yaml
    - test
      - back-end-springboot-test-connection.yaml
- Front-End
  - React SPA
  - URL: www.helm3training.com
  - YAML Files
    - front-end-react-deployment.yaml
    - front-end-react-service.yaml
    - front-end-react-ingress.yaml
    - test
      - front-end-react-test-connection.yaml 
### Find couse Charts Value   
- Redis Service Name 
- Redis Service Port
### Effect YAML Files
- DB
  - Redis - One Node 
  - Service Name: back-end-db-redis
  - YAML Files
    - back-end-db-redis-service.yaml
    - test
      - back-end-db-redis-test-connection.yaml 
- Back-End 
  - Spring Boot as restful web services
  - URL: api.helm3training.com 
  - YAML Files
    - back-end-springboot-config.yaml
 
## How to add Global Values in Three Tiers Application?
- Add Global Values into three values.yaml
  ```global:
      redisServiceName: three-tier-app-back-end-db-redis
      redisServicePort: 6379
  ```   
- Add Global Values into templates yaml files  
  ```
    {{ .Values.global.redisServiceName}}
    {{ .Values.global.redisServicePort}}     
    ```
## Demo   
- Show change Chart files
- Test my-app-back-end-db-redis
  - `helm install db .  --dry-run  --debug --namespace=qa-env --create-namespace --wait`  
  - `helm install db . --namespace=qa-env --create-namespace --wait`  
  - `helm test db --namespace=qa-env`  
- Test my-app-back-end-springboot-app
  - `helm install springboot .  --dry-run  --debug --namespace=qa-env --create-namespace --wait`  
  - `helm install springboot . --namespace=qa-env --create-namespace --wait`  
  - `helm test springboot --namespace=qa-env` 
- Test my-app-front-end-react-app
  - Clean up 
   - `helm uninstall db  --namespace=qa-env`  
   - `helm uninstall springboot  --namespace=qa-env` 
  - Update Chart dependency
     - `helm dependency list .` 
     - `helm dependency update .`  
  - `helm install my-app . --namespace=qa-env --create-namespace --wait`  
  - `helm test my-app --namespace=qa-env`