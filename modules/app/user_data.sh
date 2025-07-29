#!/bin/bash
dnf update -y
dnf install -y nginx git nodejs npm
npm install -g pm2

# Clonar la aplicación desde GitHub
git clone https://github.com/Boundengore/mean-app-devops.git /var/www/app
cd /var/www/app
npm install
pm2 start app.js

# Configuración de Nginx como proxy inverso
cat <<EOT > /etc/nginx/conf.d/mean.conf
server {
    listen 80;
    location / {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host \$host;
        proxy_cache_bypass \$http_upgrade;
    }
}
EOT

systemctl restart nginx
