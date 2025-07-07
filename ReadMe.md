# Wordpress quickstart 

Wordpress Quickstart, it is a preconfigured contenerized LAMP stack configured to run wordpress with folder storage persistence. 

## Steps 

1. Clone the repository:
```
git clone git@github.com:markh0rr/dockerized-wordpress.git
```

2. Setup the project:
```
make setup
```

<details>
<summary>What is done underneat</summary>

1. Download the wordpress software as a zip from [wordpress.org/download](https://fr.wordpress.org/download/).

2. Unzips the wordpress zip and store the resulting folder in the logic folder `logic/` as a folder named `wordpress`.


3. Creates a public key:
```
ssh-keygen -t rsa -m PEM -b 4096 -C "wordpress_cms" -f ./admin/.keys/cms.key -N ""
```

4. Create self signed ssl certificates:
```
openssl req -new -key admin/.keys/cms.key -out admin/certificates/crm.csr
openssl x509 -req -in admin/certificates/crm.csr -signkey admin/.keys/cms.key -out admin/certificates/cms.crt -days 365
```

5. Adds the content of `./debug/wp-config.php` to `logic/wordpress/wp-config.php`. This enables the error logs to be visible in `wp-content/debug.log`.
</details>

<br/>

3. Build The containers
```
make build
```

4. Run wordpress:
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
