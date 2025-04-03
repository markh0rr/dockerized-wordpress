# Wordpress quickstart 

Wordpress Quickstart, it is a preconfigured contenerized LAMP stack configured to run wordpress with folder storage persistence. 

## Steps 

0. Clone the repository:
```
git clone git@github.com:markh0rr/dockerized-wordpress.git
```

1. Create the folder architecture in the cloned folder:
```
mkdir -p admin/certificates
mkdir -p admin/.keys
mkdir -p admin/logs
```

2. Download the wordpress software as a zip from [wordpress.org/download](https://fr.wordpress.org/download/).

3. Unzip it and store the resulting folder in the logic folder `logic/` as a folder named `wordpress`.

4. Create a public key:
```
ssh-keygen -t rsa -m PEM -b 4096 -C "wordpress_cms" -f ./admin/.keys/cms.key -N ""
```

5. Create self signed ssl certificates:
```
openssl req -new -key admin/.keys/cms.key -out admin/certificates/crm.csr
openssl x509 -req -in admin/certificates/crm.csr -signkey admin/.keys/cms.key -out admin/certificates/cms.crt -days 365
```

Beware that after the first run of the container, the root user is created together with the provided password. To change the password it is not sufficient to change the MYSQL_ROOT_PASSWORD variable. 

6. In the wordpress folder at `logic/wordpress/wp-config.php`, append / modify those line: 
```php
define('WP_DEBUG', true);
define('WP_DEBUG_LOG', true);
define('WP_DEBUG_DISPLAY', false);
```

Logs are now visible in `wp-content/debug.log`.

7. Run wordpress:
```
make run
```

## Access the website and administration pannel

On the first access to the website, wordpress initiates the website and asks to create the admin account.

The website is visible on wordpress [localhost:8080](http://localhost:8080).

The admin pannel is available at [localhost:8080/wp-admin](http://localhost:8080/wp-admin).

## Annex

Shell into docker: 
```
docker ps 
docker exec -it <container_id> sh 
```

Troubleshoot the database from within the cms logic container. 
```
apk add mysql-client
mysql -u root -p -h cms_db
```
