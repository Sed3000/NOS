sed -i -e 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
sed -i -e 's/PasswordAuthentication no/#PasswordAuthentication no/' /etc/ssh/sshd_config
systemctl restart sshd
