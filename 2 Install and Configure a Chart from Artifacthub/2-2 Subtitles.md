Hi everybody. I'm Lian Duan. Today we are going to talk about Create a Your First Helm Chart. 
The tpioc I'm go though in this video are 

## Topics
-  Creates a chart directory
-  Install a Chart
-  Install a Chart with NameSpace
-  Uninstall a Chart   
## Creates a Chart directory
 - `helm create my-app-config`
```
my-app-config
├── charts
├── Chart.yaml          # Information about your chart  Chart.yaml：存储一些元数据，例如chart的信息，描述等等
There are three potential sources of values:

A chart's values.yaml file
A values file supplied by helm install -f or helm upgrade -f
The values passed to a --set or --set-string flag on helm install or helm upgrade

├── templates            # The template files  是所有资源的位置，我们可以看到很多kubernetes的资源文件都在这里存放。
│   ├── deployment.yaml
│   ├── _helpers.tpl
│   ├── hpa.yaml
│   ├── ingress.yaml
│   ├── NOTES.txt       #相当于你运行helm install的时候给用户输出的提示。
│   ├── serviceaccount.yaml
│   ├── service.yaml
│   └── tests
│       └── test-connection.yaml
└── values.yaml         # The default values for your templates  存储该chart的默认值，实际安装时可以对默认值进行覆盖。

```
## Install a Chart 

- helm install my-app-config ./my-app-config/

my-app-config.yaml   
```
 apiVersion: v1
kind: ConfigMap
metadata:
  name: my-app-config
data:
  username: lian
```   
- Check ConfigMap
   - `kubectl get ConfigMap`
   - `kubectl get ConfigMap my-app-config -o yaml`
- Get Release List 
   - `helm list` 

## Install a Chart with NameSpace
- `helm install my-app-config ./my-app-config/ --namespace=qa-env --create-namespace --wait` 
- Check ConfigMap
   - `kubectl get ConfigMap --namespace=qa-env`
   - `kubectl get ConfigMap my-app-config -o yaml --namespace=qa-env`
- `helm list --namespace=qa-env` 

## Uninstall a Chart 
- `helm uninstall my-app-config`   
- `kubectl get ConfigMap`   
- `helm uninstall my-app-config --namespace=qa-env`   
- `kubectl get ConfigMap --namespace=qa-env` 

<font size=1 >Icons made by www.freepik.com</font> 

## Today we learned,
-  How to find Find Compatible Helm 3 Version?
-  Install Helm 3
-  Helm Repos
-  Check Helm Client 
---------------------------------------

Thnaks you for you witch the video. I hote it was help and it  was. do no forget to like it. 
If you want to be notified whenever a new video comes out then subscribe to my channel. 
If you have any question or something was not clear in the video. 
Please post them in a comment section below and i will try to answer.
Thank you and see you in the next video.