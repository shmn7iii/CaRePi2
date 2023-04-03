DOCKER_COMPOSE=./compose.yml
DOCKER_COMPOSE_PRODUCTION=./compose.production.yml

docker/up:
	docker compose -f $(DOCKER_COMPOSE) up -d --build

docker/start:
	docker compose -f $(DOCKER_COMPOSE) start

docker/stop:
	docker compose -f $(DOCKER_COMPOSE) stop

docker/down:
	docker compose -f $(DOCKER_COMPOSE) down --volumes

docker/logs:
	docker compose logs -f

prod/docker/up:
	docker compose -f $(DOCKER_COMPOSE_PRODUCTION) up -d --build

prod/docker/start:
	docker compose -f $(DOCKER_COMPOSE_PRODUCTION) start

prod/docker/stop:
	docker compose -f $(DOCKER_COMPOSE_PRODUCTION) stop

prod/docker/down:
	docker compose -f $(DOCKER_COMPOSE_PRODUCTION) down --volumes
