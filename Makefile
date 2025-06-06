setup:
	@wget https://wordpress.org/latest.zip
	@unzip latest.zip && rm latest.zip
	@mv wordpress logic/wordpress
	@cp debug/wp-config.php logic/wordpress/wp-config.php
	@ssh-keygen -t rsa -m PEM -b 4096 -C "wordpress_cms" -f admin/.keys/cms.key -N ""
	@openssl req -new -key admin/.keys/cms.key -out admin/certificates/crm.csr  -subj "/C=FR/ST=Region/L=City/O=Organization/OU=Department/CN=Domain name"
	@openssl x509 -req -in admin/certificates/crm.csr -signkey admin/.keys/cms.key -out admin/certificates/cms.crt -days 365

run:
	@docker-compose up --build
	
build:
	@docker-compose build

clean:
	@docker-compose down

reset:
	@docker-compose down
	@rm -rf ./db/data
	@rm -rf ./logic/wordpress
	@cp -r ../wp_software/wordpress ./logic
	@cp ./debug/wp-config.php ./logic/wordpress

sh:
	@docker ps
	@{ \
		echo "\nselect a container name from above or CTRL + C to quit"; \
		read container_name; \
		docker exec -it "$$container_name" sh; \
	}