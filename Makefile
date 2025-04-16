build:
	echo 'Do nothing'

.PHONY: create_manual_migration create_migration_diff

create_manual_migration:
	@atlas migrate new $(name)

create_migration_diff:
	@atlas migrate diff $(name) --env dev

test:
	docker compose up postgres_test -d
	# Here use port of DB inside the container, not the one being exposed to the host machine
	until docker exec $$(docker compose ps -q postgres_test) pg_isready -U testuser -h localhost -p 5432; do sleep 1; done
	atlas migrate apply --url "postgresql://testuser:testpassword@localhost:6231/testdb?sslmode=disable"
	docker compose down postgres_test --volumes