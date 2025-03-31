#!/bin/sh
## required to run be able to resize and cut images 
echo "extension=gd" >> /etc/php*/php.ini 


echo "[+] starting the apache2 server..."

httpd -S
httpd -D FOREGROUND

echo "[-] could not run the server"
sh