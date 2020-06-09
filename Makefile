REPO=django-template
TAG=latest
#TAG=1.1.01
GUID=kagaston

initialize:
	echo $REPO >> README.md
	git init
	git add README.md
	git commit -m "Initial Commit"
	git remote add origin git@github.com:$(GUID)/$(REPO).git
	git push -u origin master

build:  ## create the build and runtime images
	@docker build --build-arg DEVEL=no -t django-$(REPO):$(TAG) -f ./docker/django/Dockerfile .

build-dev:  ## create the dev build and runtime images
	@docker build --build-arg DEVEL=yes -t django-$(REPO):dev -f ./docker/django/Dockerfile .

compile: requirements/main.in ## compile latest requirements to be built into the docker image
	@docker run --rm -v $(shell pwd)/requirements:/local django:dev python -m piptools compile --upgrade --no-annotate --no-header --allow-unsafe --generate-hashes --output-file /local/main.txt /local/main.in
	@docker run --rm -v $(shell pwd)/requirements:/local django:dev python -m piptools compile --upgrade --no-annotate --no-header --allow-unsafe --generate-hashes --output-file /local/tests.txt /local/tests.in

destroy-data: ## Remove the database volumes to start fresh
	@docker volume rm -f postgres_data
	@docker volume rm -f postgres_data_backups

clean: ## remove the latest build
	@docker rmi -f django-$(REPO):$(TAG)
	@docker rmi -f django-$(REPO):dev

squeaky-clean:  clean  ## aggressively remove unused images
	@docker rmi oraclelinux:8.2
	@docker system prune -a
	@for image in `docker images -f "dangling=true" -q`; do echo removing $$image && docker rmi $$image ; done

update: ## Grab latest images for project
	@docker pull oraclelinux:8.2
	@docker pull postgres:12.2
	@docker pull mailhog/mailhog:v1.0.0

update-requirements:
	@sh requirements/update-requirements.sh

superuser:
	@docker exec -it django-project_django_1 python manage.py createsuperuser
