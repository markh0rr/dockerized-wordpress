#!/bin/sh
## requirements and server configuration
PHP_INI_PATH=$(php --ini | grep "Loaded Configuration File" | awk '{print $NF}')

echo "memory_limit = 256M" >> $PHP_INI_PATH
echo "max_execution_time = 1200" >> $PHP_INI_PATH
echo "upload_max_filesize = 100M" >> $PHP_INI_PATH
echo "max_input_vars = 4000" >> $PHP_INI_PAT
echo "max_input_time = 600" >> $PHP_INI_PAT
echo "max_file_uploads = 20" >> $PHP_INI_PAT
echo "post_max_size = 1000M" >> $PHP_INI_PAT
echo "output_buffering = 4096" >> $PHP_INI_PAT

echo "extension=xmlreader" >> $PHP_INI_PATH

chmod -R 777 /wordpress/wp-content/

## start the webservice
echo "[+] starting the apache2 server..."
httpd -S
httpd -D FOREGROUND
echo "[-] could not run the server"