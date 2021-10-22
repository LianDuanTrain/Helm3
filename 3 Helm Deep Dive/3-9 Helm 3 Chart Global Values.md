# 3-9 Helm 3 Chart Global Values
## Topics  
- How to handle Values crose Charts?
- What is Global Values?
- Which valus are should be Global Values?
- How to add Global Values in Three Tiers Application?
- Demo
 
## How to handle Values crose Charts?
- Challenge
  - A subchart can never explicitly depend on its parent chart
  - A subchart cannot access the values of its parent

- Solution
  - A parent chart can override values for subcharts
  - Global Values 
## What is Global Values?
- Accesse any chart or subchart by exactly the same name.
- Type Values.global

## Which valus are should be Global Values?
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