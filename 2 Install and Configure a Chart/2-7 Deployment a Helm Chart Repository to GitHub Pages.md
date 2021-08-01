
# Deployment a Helm Chart Repository to GitHub Pages
## Topics
- What is GitHub Pages  
- Deployment a Helm Chart Repository to GitHub Pages   
- Install a Chart from Helm Chart Repository of Github Pages 

## What is GitHub Pages? 
GitHub Pages is a static site hosting service provided by GitHub.

## Deployment a Helm Chart Repository to GitHub Pages 
- Create a new repository on your Github account
- Upload the index.yaml ,my-app-config-1.0.0.tgz and my-app-config-2.0.0.tgz to https://lianduantrain.github.io/Helm3/stable
- Create a README.MD file and upload to https://lianduantrain.github.io/Helm3
- Enable pages in Setting on Github repo
- Get Github Page published URL and use to `helm repo index`
- Select Branch
  
## Install a Chart from Helm Chart Repository of Github Pages
- `helm repo add my-app-config-stable https://lianduantrain.github.io/Helm3/stable`  
- `helm repo update`  
- `helm search repo -l my-app-config-stable`  
- `helm install my-release my-app-config-stable/my-app-config --version=1.0.0`   
- `helm upgrade my-release my-app-config-stable/my-app-config`   


<font size=1 >Icons made by www.freepik.com</font> 

    