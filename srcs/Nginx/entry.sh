adduser --disabled-password $USER
echo "$USER:$PASSWORD" | chpasswd

openssl req \
-x509 -nodes -days 365 -newkey rsa:2048 \
-keyout /etc/ssl/private/services.key \
-out /etc/ssl/certs/services.crt \
-subj "/C=KR/ST=SEOUL/O=42SEOUL/CN=$HOST_IP"

# ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
# ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa

# mkdir -p /var/run/sshd
# /usr/sbin/sshd

mkdir -p /run/nginx
nginx -g "daemon off;"