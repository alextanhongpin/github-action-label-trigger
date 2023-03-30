include .env
export

up:
	@docker-compose up -d


down:
	@docker-compose down


cli:
	@docker exec -it $(shell docker ps -q --filter='ancestor=mysql:8.0.32') mysql $(DB_NAME)


install:
	@go install github.com/skeema/skeema@v1.9.0


init:
	@skeema init -h $(DB_HOST) -p $(DB_PORT) -u $(DB_USER) -p$(DB_PASS) --schema $(DB_NAME) -d schemas/


pull:
	@skeema pull development -p$(DB_PASS)


diff:
	@skeema diff development -u root > diff.sql


push:
	@skeema push development -u root


add-environment:
	@cd schemas && skeema add-environment development -h $(DB_HOST) -u $(DB_USER) -p$(DB_PASS)
	@cd schemas && skeema add-environment production -h $(DB_HOST) -u $(DB_USER) -p$(DB_PASS)
