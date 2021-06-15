Hi everybody. I'm Lian Duan. Today we are going to talk about Create a Your First Helm Chart. 
The tpioc I'm go though in this video are 

## Topics
-  Creates a Chart directory
-  Creates a K8S Resource in Chart 
-  Verify Chart

Befroe i go to todats topics, let review what is chart.

- Chart
Helm uses a packaging format called charts.
A chart is a collection of files that describe set of Kubernetes resources. 
A single chart might be used to deploy something simple, like a memcached pod, or something complex, like a full web app stack with HTTP servers, databases, caches,APi Server.



## First topic Creates a Chart directory
command is helm create + chart nema , based on helm best priesctic the chart name should be all lower case, my chart name is my-app-config`
 - 
Chart directory is created, go thought each sub folder and file.
```
my-app-config
├── charts             # A directory containing  chart depends.
If my chart defined dependencies, and  helm dependency update command is called. 
My chart dependency will  download to charts/ directory .

├── Chart.yaml          # Information about your chart  Chart.yaml, such as chart mate data and discptation.
├── templates  folder          # The template files, all my chart k8s resource file store in the folder.
│   ├── deployment.yaml       #  chart defined dependencies
│   ├── _helpers.tpl           # predefine the helm founction
│   ├── hpa.yaml               # auto scling info beased on metrics-server
│   ├── ingress.yaml           # ingress resource
│   ├── NOTES.txt              # the conten show when you run helm install command
│   ├── serviceaccount.yaml    # K8s RBAC infomation 
│   ├── service.yaml           # service resource define 
│   └── tests
│       └── test-connection.yaml  # create a pod and then run a command to verify my chart.
There are three potential sources of values:
A chart's values.yaml file
A values file supplied by helm install -f or helm upgrade -f
The values passed to a --set or --set-string flag on helm install or helm upgrade
└── values.yaml         # The default values for chart templates. 实际安装时可以对默认值进行覆盖。



```
## next topic Creates a K8S resource in Chart 
Delete all file under the templates folder sinc my char is a sinmple resource.

my-app-config.yaml   
```
apiVersion: v1
kind: ConfigMap
metadata:
  name: my-app-config
data:
  username: lian
```   


## latest topic Verify Chart
- the cammand is `helm lint` 

<font size=1 >Icons made by www.freepik.com</font> 

## Today we learned,
-  use helm create command to enert  a Chart directory
-  Creates a K8S resource in Chart 
-  Verify Chart by helm lint command
---------------------------------------

Thnaks you for you witch the video. I hote it was help and it  was. do no forget to like it. 
If you want to be notified whenever a new video comes out then subscribe to my channel. 
If you have any question or something was not clear in the video. 
Please post them in a comment section below and i will try to answer.
Thank you and see you in the next video.