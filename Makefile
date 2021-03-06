DB_CONTAINER_NAME:=beginners-mysql
DBNAME:=beginners
ENV:=development

mysql:
	mysql -u root -h localhost -P 3306 --protocol=tcp -p

deps:
	which dep || go get -v -u github.com/golang/dep/cmd/dep
	dep ensure
	go get github.com/rubenv/sql-migrate/...

test:
	go test -v ./...

integration-test:
	go test -v ./... -tags=integration

run:
	go run cmd/base.go

migrate/init:
	mysql -u root -h localhost --protocol tcp -e "create database \`$(DBNAME)\`" -p

migrate/up:
	sql-migrate up -env=$(ENV)

migrate/down:
	sql-migrate down -env=$(ENV)

migrate/status:
	sql-migrate status -env=$(ENV)

migrate/dry:
	sql-migrate up -dryrun -env=$(ENV)

docker/build: docker-compose.yml
	docker-compose build

docker/start:
	docker-compose up -d

docker/logs:
	docker-compose logs

docker/clean:
	docker-compose rm

docker/bash:
	docker exec -it $(shell docker-compose ps -q) bash

DB_PASSWORD=password
DB_NAME=beginners

docker/mysql:
	docker-compose exec db mysql -p$(DB_PASSWORD) $(DB_NAME)