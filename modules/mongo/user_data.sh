#!/bin/bash
set -e

# Actualizar paquetes
sudo yum update -y

# Agregar el repositorio oficial de MongoDB para RHEL 9
cat <<EOF | sudo tee /etc/yum.repos.d/mongodb-org.repo
[mongodb-org-7.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/\$releasever/mongodb-org/7.0/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-7.0.asc
EOF

# Instalar MongoDB
sudo yum install -y mongodb-org

# Habilitar y arrancar el servicio
sudo systemctl enable mongod
sudo systemctl start mongod
