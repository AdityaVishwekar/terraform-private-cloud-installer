sed -i 'deb http://nginx.org/packages/mainline/ubuntu/ bionic nginx' -e '$a\' /etc/apt/sources.list
wget http://nginx.org/keys/nginx_signing.key
apt-key add nginx_signing.key
apt update -y
apt install nginx -y
systemctl start nginx
systemctl enable nginx