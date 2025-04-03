run:
	@docker-compose up --build
	
build:
	@docker-compose build

sh:
	@docker ps
	@{ \
		echo "\nselect a container name from above or CTRL + C to quit"; \
		read container_name; \
		docker exec -it "$$container_name" sh; \
	}