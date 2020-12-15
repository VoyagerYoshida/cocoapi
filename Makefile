IMAGE_NAME := ntteast/coco
WORKING_DIR := /var/www
PWD := $(shell pwd)

.PHONY: build
build:
	@docker build . -f ./docker/Dockerfile -t $(IMAGE_NAME)

.PHONY: run/cpu
run/cpu:
	@docker run -it -u root -p 8888:8888 -v $(PWD):$(WORKING_DIR) $(IMAGE_NAME) bash

.PHONY: run/gpu
run/gpu:
	@docker run --gpus all -it -u root -v $(PWD):$(WORKING_DIR) $(IMAGE_NAME) bash

.PHONY: note
note:
	@jupyter notebook --ip 0.0.0.0 --port 8888 --no-browser --allow-root
