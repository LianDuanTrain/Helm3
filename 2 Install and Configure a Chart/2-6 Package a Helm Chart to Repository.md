
# Package a Helm Chart for Repository
## Topics
- What is Chart Repository?      
- Chart Repository Structure 
- Package a Chart    
## What is Chart Repository?
- Chart Repository Request
  - HTTP Server
    - YAML file
    - Tar files  
- Public Chart Repository
  - Google Cloud Storage (GCS) bucket
  - Amazon S3 bucket
  - GitHub Pages

## Chart Repository Structure 

```
charts/
  |
  |- index.yaml
  |
  |- my-app-config-1.0.0.tgz
  |
  |- my-app-config-2.0.0.tgz
```
## Package a Chart
### Package my-app-config Chart V1
-`helm package .`
### Create index.yaml
-`helm repo index --url  https://lianduantrain.github.io/Helm3/stable/ .`
### Package my-app-config Chart V2
-`helm package .`
### Merge my-app-config index.yaml
-`helm repo index --url https://lianduantrain.github.io/Helm3/stable/ --merge index.yaml .`
  
```


<font size=1 >Icons made by www.freepik.com</font> 

    