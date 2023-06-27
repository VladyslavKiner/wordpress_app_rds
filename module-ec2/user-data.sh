#!/bin/bash

yum install -y httpd
service httpd start
service httpd enable
cd /home/ec2-user
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
cd wordpress
cp wp-config-sample.php wp-config.php
sed -i  's/username_here/admin/; s/database_name_here/wordpress/; s/password_here/adminadmin/' wp-config.php
sed -i 's/localhost/${rds}/' wp-config.php
amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
yum install php-mbstring php-xml -y
cd /home/ec2-user
sudo cp -r wordpress/* /var/www/html/
sudo service httpd restart
systemctl restart php-fpm
usermod -a -G apache ec2-user
chown -R ec2-user:apache /var/www
chmod 2775 /var/www && find /var/www -type d -exec sudo chmod 2775 {} \;
find /var/www -type f -exec sudo chmod 0664 {} \;