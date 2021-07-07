
# Deployment a Helm Chart Repository to GitHub Pages
## Topics
- What is GitHub Pages  
- Deployment a Helm Chart Repository to GitHub Pages   
- Install a Chart from Helm Chart Repository of Github Page 

## What is GitHub Pages? 
GitHub Pages is a static site hosting service provided to you by GitHub, designed to host your pages directly from a GitHub repository. GitHub Pages is a perfect match for our purpose, since everything we need is to host a single index.yaml file along with a bunch of .tgz files.
Why not hosting all this stuff in your own web server? A managed service helps to reduce your operational overhead and risk (think to monitoring, patch management, security, backup services…) so you can focus on code and in what makes your business relevant for your customers.

## Deployment a Helm Chart Repository to GitHub Pages 
- Create a new repository on your Github account
- Upload the index.yaml ,my-app-config-1.0.0.tgz and my-app-config-2.0.0.tgz
- Create a README.MD file and upload
- Enable pages in Setting on  Github repo
- Check Github Page published URL
- Select Branch
  
## Install a Chart from Helm Chart Repository of Github Page
- `helm repo add my-app-config-stable https://lianduantrain.github.io/Helm3/stable`  
- `helm repo update`  
- `helm search repo -l my-app-config-stable`  
- `helm install my-release my-app-config-stable/my-app-config --version=1.0.0`   
- `helm upgrade my-release my-app-config-stable/my-app-config`   


<font size=1 >Icons made by www.freepik.com</font> 

    