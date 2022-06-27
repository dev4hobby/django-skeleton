# Django Skeleton

A template repository created to be used when implementing simple features in Django.

- Python 3.9
- Django (w/ DRF)
- pip-tools (for managing requirements)
- black (for code formatting)
- MySQL
- Redis
- RabbitMQ (w/ Celery)
- Nginx (w/ uvicorn + gunicorn)

## Usage

### Dependencies

```bash
make dep-sync
```

### Local development

```bash
# term 1
make run-local

# term 2 (after term 1 finishes)
make db-migrate
```

### Docker

```bash
# term 1
make build-docker # or (build-docker-prod)

# term 2 (after term 1 finishes)
make db-migrate # or (db-migrate-prod)
```

### Deatils

```bash
❯ make help
black                Apply black formatting
build-docker         Build the docker image.
clean-docker         Clean the docker container.
db-migrate           Migrate DB
dep-compile          Compile the dependencies.
dep-lock             Freeze deps in 'requirements.txt' file.
dep-sync             Sync venv installation with 'requirements.txt' file
dep-update           Update all the deps.
help                 Show this help message.
lint-check           Check whether the codebase satisfies the linter rules.
run-docker           Run the docker container.
run-local            Run the local server.
stop-docker          Stop the docker container.
test                 Run the tests against the current version of Python.
```
