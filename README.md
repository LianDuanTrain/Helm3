# Helm3
NGINX - Helm Charts
This repository contains packaged Helm charts provided by NGINX.

NGINX Ingress Controller
Documentation
https://docs.nginx.com/nginx-ingress-controller/installation/installation-with-helm/

Add Repository (stable)
$ helm repo add nginx-stable https://helm.nginx.com/stable
$ helm repo update
Add Repository (experimental)
$ helm repo add nginx-edge https://helm.nginx.com/edge
$ helm repo update
Install Packages (stable)
$ helm install my-release nginx-stable/nginx-ingress [--version 0.4.1]
Install Packages (experimental)
$ helm install my-release nginx-edge/nginx-ingress --devel
