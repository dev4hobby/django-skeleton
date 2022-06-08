path := .

define Comment
	- Run `make help` to see all the available options.
endef

.PHONY: lint ## Apply lint
lint: black

.PHONY: lint-check
lint-check: ## Check whether the codebase satisfies the linter rules.
	@echo
	@echo "Checking linter rules..."
	@echo "========================"
	@echo
	@black --check $(path)
	@echo

.PHONY: black
black: ## Apply black formatting
	@echo
	@echo "Formatting code..."
	@echo "=================="
	@echo
	@black --fast $(path)
	@echo

.PHONY: help
help: ## Show this help message.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.PHONY: test
test: ## Run the tests against the current version of Python.
	pytest

.PHONY: dep-compile
dep-compile: ## Compile the dependencies.
	@echo
	@echo "Compiling dependencies..."
	@echo "========================"
	@echo
	@pip-compile
	@echo

.PHONY: dep-lock
dep-lock: ## Freeze deps in 'requirements.txt' file.
	@pip-compile requirements.in -o requirements.txt
	@pip-compile requirements-dev.in -o requirements-dev.txt

.PHONY: dep-sync
dep-sync: ## Sync venv installation with 'requirements.txt' file
	@chmod +x ./scripts/check-pip-tools.sh
	@./scripts/check-pip-tools.sh
	@pip-sync

.PHONY: dep-update
dep-update: ## Update all the deps.
	@chmod +x ./scripts/check-pip-tools.sh
	@./scripts/check-pip-tools.sh
	@chmod +x ./scripts/update-deps.sh
	@./scripts/update-deps.sh

.PHONY: build-docker
build-docker: ## Build the docker image.
	docker-compose up --build

.PHONY: run-docker
run-docker: ## Run the docker container.
	docker-compose up -d

.PHONY: run-docker-prod
run-docker-prod:
	docker-compose -f docker-compose.prod.yml up -d --build

.PHONY: stop-docker
stop-docker: ## Stop the docker container.
	docker-compose stop

.PHONY: clean-docker
clean-docker: ## Clean the docker container.
	docker-compose down

.PHONY: run-local
run-local: ## Run the local server.
	@echo
	@echo "Running local server..."
	@echo "======================"
	@echo
	@echo "Running MySQL partially"
	docker-compose up -d mysql
	python manage.py runserver 0.0.0.0:8086

.PHONY: db-migrate
db-migrate: ## Migrate DB
	@echo
	@echo "Migrating DB..."
	@echo "================"
	@echo
	docker-compose up -d mysql
	python manage.py makemigrations
	python manage.py migrate