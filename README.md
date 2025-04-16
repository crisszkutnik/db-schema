## Development setup

First, we need to spin up a Postgres instance with Docker that can be used as Atlas dev DB

```bash
docker compose up postgres_dev
```

Then you can normally develop and:

### Create migrations from diff

```bash
make create_migration_diff name=<migration_name>
```

### Create manual migration

```bash
make create_manual_migration name=<migration_name>
```

### Apply dev migrations

```bash
atlas migrate apply --env dev --revisions-schema public
```

## Testing

Running `make test` will

1. Spin up a Postgres DB with Docker
2. Run `atlas migrate apply` inside that container
3. If successful, destroy all resources

## Applying prod changes

There is currently no automation to do this. Just run.

```bash
atlas migrate apply --env prod --revisions-schema public
```
