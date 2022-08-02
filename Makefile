all: build run

build:
	docker-compose -f ci/docker/docker-compose.yml build --no-cache --build-arg hostUID=1000 --build-arg hostGID=1000 web

start: run

run:
	docker-compose -f ci/docker/docker-compose.yml -p sis-school-service up -d web

stop:
	docker-compose -f ci/docker/docker-compose.yml -p sis-school-service kill

destroy:
	docker-compose -f ci/docker/docker-compose.yml -p sis-school-service down

logs:
	docker-compose -f ci/docker/docker-compose.yml -p sis-school-service logs -f web

shell:
	docker-compose -f ci/docker/docker-compose.yml -p sis-school-service exec --user nginx web bash

root:
	docker-compose -f ci/docker/docker-compose.yml -p sis-school-service exec web bash

ip:
	docker inspect sis-school-service-web | grep \"IPAddress\"

