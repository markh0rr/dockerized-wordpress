#!/bin/sh
## requirements and server configuration
PHP_INI_PATH=$(php --ini | grep "Loaded Configuration File" | awk '{print $NF}')

echo "memory_limit = 256M" >> $PHP_INI_PATH
echo "max_execution_time = 300" >> $PHP_INI_PATH
echo "upload_max_filesize = 50M" >> $PHP_INI_PATH

echo "extension=gd" >> $PHP_INI_PATH
echo "extension=curl" >> $PHP_INI_PATH
echo "extension=xmlreader" >> $PHP_INI_PATH

chmod -R 777 /wordpress/wp-content/

## start the webservice
echo "[+] starting the apache2 server..."
httpd -S
httpd -D FOREGROUND
echo "[-] could not run the server"