DOCKER_IMAGE = pricesearcher/spark:2.4.1

build:
	@docker build -t $(DOCKER_IMAGE) .

shell: build
	@docker run \
	--rm \
	-it \
	--ulimit memlock=-1:-1 \
	--ulimit nofile=262144:262144 \
	-p 4040:4040 \
	--entrypoint sh \
	--env AWS_ACCESS_KEY_ID=$(AWS_ACCESS_KEY_ID) \
	--env AWS_SECRET_ACCESS_KEY=$(AWS_SECRET_ACCESS_KEY) \
	--env AWS_DEFAULT_REGION=$(AWS_DEFAULT_REGION) \
	$(DOCKER_IMAGE) -c "pipenv run pyspark"