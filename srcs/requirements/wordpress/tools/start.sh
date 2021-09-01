# ! /bin/bash
echo "127.0.0.1       $CUSTOM_URL" >> /etc/hosts
sed -i -e "s/localhost/${DB_HOST}/g" wordpress/wp-config-sample.php
sed -i -e "s/database_name_here/${DB_NAME}/g" wordpress/wp-config-sample.php
sed -i -e "s/username_here/${DB_USER}/g" wordpress/wp-config-sample.php
sed -i -e "s/password_here/${DB_PASSWORD}/g" wordpress/wp-config-sample.php
echo "define('WP_REDIS_HOST', '$REDIS_HOST');" >> wordpress/wp-config-sample.php
echo "define('WP_REDIS_PORT', '$REDIS_PORT');" >> wordpress/wp-config-sample.php
echo "define('WP_REDIS_PASSWORD', '$REDIS_PASSWORD');" >> wordpress/wp-config-sample.php
mv wordpress/wp-config-sample.php wordpress/wp-config.php
cp -r wordpress/* /var/www/html/wordpress/
mv adminer.php /var/www/html/wordpress/
mv fpm.conf /etc/php/7.3/fpm/pool.d/www.conf
chown -R www-data:www-data /var/www/html/wordpress \
  && chmod -R 775 /var/www/html/wordpress 
sleep 10
php wp-cli.phar --info
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
wp --path=/var/www/html/wordpress core install --url=$CUSTOM_URL --title='NEW SITE' --allow-root  --admin_user=root  --admin_password=12345678 --skip-email --admin_email=asd@google.ru
wp --path=/var/www/html/wordpress user create $USER_NAME user@mail.ru --allow-root --role=author  --user_pass=$USER1_PASSWD
wp --path=/var/www/html/wordpress --allow-root plugin install redis-cache
wp --path=/var/www/html/wordpress --allow-root plugin activate redis-cache
wp --path=/var/www/html/wordpress --allow-root redis enable
/usr/sbin/php-fpm7.3 -F