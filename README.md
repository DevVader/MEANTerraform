# Proyecto: Despliegue MEAN Multicapa con Terraform en AWS

## Descripción
Este proyecto tiene como objetivo desplegar una arquitectura MEAN (MongoDB, Express, Angular, Node.js) utilizando múltiples máquinas virtuales en AWS. La infraestructura está definida como código con Terraform y está dividida en módulos independientes.

## Estructura del repositorio
MEANTERRAFORM/<br>
├── main.tf # Instancia los módulos principales<br>
├── variables.tf # Variables globales<br>
├── outputs.tf # Outputs globales<br>
├── .gitignore<br>
├── README.md<br>
└── modules/<br>
├── network/ # Módulo para VPC, subredes y gateway<br>
└── app/ # Módulo para instancias App con Node.js + Nginx<br>

## Cómo ejecutar

1. Inicializar Terraform:
terraform init

2. Ver el plan de ejecución:
terraform plan

3. Aplicar los cambios:
terraform apply

## Requisitos

- Cuenta activa en AWS con permisos para crear recursos (EC2, VPC, etc.)
- Terraform versión 1.0 o superior
- Git
- Acceso a terminal o entorno de desarrollo (VS Code recomendado)

## Notas importantes

- Los archivos `.tfstate`, `.tfvars` y `.terraform/` no deben subirse al repositorio.
- Utiliza un archivo `terraform.tfvars` local o variables de entorno para manejar tus credenciales o valores sensibles.
