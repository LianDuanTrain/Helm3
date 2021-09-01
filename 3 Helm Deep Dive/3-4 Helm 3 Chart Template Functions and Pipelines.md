# Helm 3 Chart Template Functions and Pipelines
## Topics  
- What is Chart Template Functions?
- What is Chart Pipelines?  
- How to learn Chart Template Functions?  


## What is Chart Template Functions? 
- Go template language   
- Injecting strings from the .Values .Chart and .Realase object into the template  
- Sprig is template functions for Go templates (https://masterminds.github.io/sprig/ and https://helm.sh/docs/chart_template_guide/function_list/). Sprig has over 60 available functions

## What is Chart Template Pipelines? 
Pipelines are an efficient way of getting several things done in sequence. 
- ` ps -aux | grep 'java*'`
- ` {{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }`
## How to learn Chart Template Functions?
- Flow Control  
  - if/else
  - with 
  - range
- Variables  
  - $name :=
- Named Templates  
    ```
    {{ define "MY.NAME" }} 
       # body of template here
    {{ end }}
    ```
### Demo
- `helm create my-app-back-end-db-redis` 

- deployment.yaml
    ```
    metadata:
    name: {{ include "my-app-back-end-db-redis.fullname" . }}  

    ```  

- _helpers.tpl 
  
   ``` 
   Named Templates  
    {{- define "my-app-back-end-db-redis.fullname" -}}
            {{- if .Values.fullnameOverride }}
            # trimSuffix "-" "hello-"   
            # The above returns hello
                 {{- .Values.fullnameOverride | trunc 63 | trimSuffix "-"}
            {{- else }}
                {{- $name := default .Chart.Name .Values.nameOverride }}
                # func ContainsAny(s, chars string) bool
                # Contains reports whether substr is within s.
                    {{- if contains $name .Release.Name }}
                         {{- .Release.Name | trunc 63 | trimSuffix "-" }}
                    {{- else }}
                        {{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
                    {{- end }}
            {{- end }}
        {{- end }}

    ```  




   
 


