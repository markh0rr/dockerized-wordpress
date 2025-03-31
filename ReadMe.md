# Wordpress quickstart 

A volatile docker-based environment for Wordpress. 

Wordpress Quickstart, it is a preconfigured contenerized LAMP stack with folder storage persistence. 

## Steps 

0. Create the folder architecture in the cloned folder:
```
mkdir -p admin/certificates
mkdir -p admin/.keys
mkdir -p admin/logs
```

1. Download the wordpress zip from [wordpress.org/download](https://fr.wordpress.org/download/).

2. Unzip it and store the resulting folder in the logic folder `logic/` as a folder named `wordpress`.

3. Create a public key:
```
ssh-keygen -t rsa -m PEM -b 4096 -C "wordpress_cms" -f ./admin/.keys/cms.key -N ""
```

4. Create self signed ssl certificates:
```
openssl req -new -key admin/.keys/cms.key -out admin/certificates/crm.csr
openssl x509 -req -in admin/certificates/crm.csr -signkey admin/.keys/cms.key -out admin/certificates/cms.crt -days 365
```

Beware that after the first run of the container, the root user is created together with the provided password. To change the password it is not sufficient to change the MYSQL_ROOT_PASSWORD variable. 

8. Run wordpress:
```
docker-compose up --build
```

## Create the website 

On the first access to `http://localhost:8080`, wordpress configures the website and asks to create a root user with password. 

The website is visible on wordpress `http://localhost:8080`.

The admin pannel is available at `http://localhost:8080/wp-admin`.

## Annexe 

Shell into docker: 
```
docker ps 
docker exec -it <container_id> sh 
```

Remove the network:
```
docker network rm cms_network
```

Troubleshoot database status from cms logic container. 
```
apk add mysql-client
mysql -u root -p -h cms_db
```



