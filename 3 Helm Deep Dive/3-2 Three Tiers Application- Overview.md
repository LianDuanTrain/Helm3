# Three Tiers Application- Overview 
## Topics  
- Application Overview      
- Demo
 
## Application Overview  
<image src= Helm3.jpg/ width=50%>  

- Front-End
  - React SPA
  - URL: www.helm3training.com
  - YAML Files
    - front-end-ingress.yaml
    - front-end-react-app.yaml
- Back-End 
  - Spring Boot as restful web services
  - URL: api.helm3training.com 
  - YAML Files
    - back-end-ingress.yaml
    - back-end-springboot-config.yaml
    - back-end-springboot-demo.yaml
- DB
  - Redis - One Node 
  - Service Name: back-end-db-redis
  - YAML Files
    - back-end-db-redis-config.yaml
    - back-end-db-redis.yaml
## Demo
- Install Release
  - `helm install my-app  .  --namespace=qa-env --create-namespace --wait`
  - Add www.helm3training.com and api.helm3training.com on hosts file
- Check K8s resource status via K8s Dashboard  
- Test UI Add user, List user, and Delete User 



  
   
 


