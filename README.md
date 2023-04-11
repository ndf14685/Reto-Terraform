#   Despliegue de un clúster de Kubernetes en Digital Ocean con Nginx Ingress Controller, Prometheus y Grafana utilizando Terraform
## Objetivo

Implementar una infraestructura de Kubernetes en Digital Ocean que incluya un controlador de ingreso Nginx, Prometheus y Grafana para monitoreo, utilizando Terraform para la automatización de la infraestructura. Esta infraestructura debe ser fácil de replicar en diferentes ambientes (Dev, Staging, Production, etc.) y mantener el código en un repositorio.

## Pre-requisitos

Cuenta en Digital Ocean.
Token de acceso personal (API Key) de Digital Ocean.
Herramientas instaladas: Terraform, Helm, Cliente de Digital Ocean (doctl), git y kubectl.

## Procedimiento

Crear un nuevo repositorio en GitHub o en otro proveedor de repositorios Git. Incluir un archivo README.md para describir el propósito del repositorio y la estructura básica de los archivos de Terraform.

Clonar el repositorio en local:

```git clone <URL_DEL_REPOSITORIO>```

Navegar al directorio del repositorio clonado y crear la estructura básica de archivos de Terraform:


```main.tf
variables.tf
outputs.tf
backend.config
```

Agregar backend.config al archivo .gitignore para evitar subir información sensible al repositorio.

Configurar las credenciales de acceso a Digital Ocean en el entorno local:

PowerShell:

```$Env:DIGITALOCEAN_ACCESS_TOKEN = "<YOUR_ACCESS_TOKEN>"```


```set DIGITALOCEAN_ACCESS_TOKEN=<YOUR_ACCESS_TOKEN>```

Crear la estructura de carpetas para los módulos Terraform y el archivo values.yml para la configuración de Grafana en Kubernetes.

Configurar el archivo main.tf para crear el clúster de Kubernetes, el controlador de ingreso Nginx, Prometheus y Grafana.

Configurar el archivo variables.tf para incluir todas las variables necesarias para la creación de los recursos.

Configurar el archivo outputs.tf para obtener la información de salida relevante, como las direcciones IP de los servicios.

Configurar kubectl para utilizar el clúster de Kubernetes creado:


```doctl kubernetes cluster kubeconfig save <CLUSTER_ID>```

Instalar el controlador de ingreso Nginx, Prometheus y Grafana utilizando Helm.

Configurar el archivo values.yml para personalizar la configuración de Grafana en Kubernetes.

Configurar el dominio personalizado en el archivo variables.tf.

Subir los cambios al repositorio Git:

```
git add .
git commit -m "Configuración inicial"
git push
```


Crear un archivo terraform.tfvars para cada ambiente (Dev, Staging, Production, etc.) y establecer los valores específicos para cada ambiente:

```
cluster_name = "NOMBRE_CLUSTER_AMBIENTE"
domain = "DOMINIO_SEGUN_AMBIENTE"
grafana_admin_password = "PASS_PARA_AMBIENTE"
```

Configurar el backend de Terraform para almacenar el estado en un Space de Digital Ocean:
Crear un Space en Digital Ocean desde la consola gráfica.

Establecer las variables de entorno

DIG_OC_ACCESSKEY y DIG_OC_SECRETKEY con las credenciales de acceso al Space.

Crear un archivo backend.config en la raíz del repositorio con el siguiente contenido:

```
access_key = ""
secret_key = ""
```

Inicializar Terraform con el backend de Digital Ocean configurado:
PowerShell:

```
$env:TF_VAR_access_key=$env:DIG_OC_ACCESSKEY
$env:TF_VAR_secret_key=$env:DIG_OC_SECRETKEY
terraform init -backend-config="access_key=$($env:TF_VAR_access_key)" -backend-config="secret_key=$($env:TF_VAR_secret_key)"
```


Ejecutar Terraform para crear o actualizar la infraestructura en función de los archivos de configuración:

```terraform apply```

Ademas hay que considerar que necesito obtener la ip a traves de comandos doctl y kubectl, autenticando con el token ambas herramientas: 

```
doctl auth init

$Env:DIGITALOCEAN_ACCESS_TOKEN = "TU_TOKEN"

doctl auth init

doctl kubernetes cluster list

doctl kubernetes cluster kubeconfig save 58ca802b-a43c-41fd-bc41-2441c9f2c68a451a9234326d567b2c9bba107adb"f7e1fb380d0
```

Para obtener la dirección IP del servicio Grafana, ejecutar el siguiente comando:

```kubectl get svc grafana -o jsonpath='{.status.loadBalancer.ingress[0].ip}'```

Con estos pasos, se creará un clúster de Kubernetes en Digital Ocean con Nginx Ingress Controller, Prometheus y Grafana utilizando Terraform. La estructura de módulos y la utilización de variables permiten replicar fácilmente la infraestructura en diferentes ambientes y mantener el código en un repositorio.



