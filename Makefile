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