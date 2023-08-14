
# Variables
DOCKER_IMAGE_NAME = optimized_casa
DOCKER_TAG = latest
SINGULARITY_IMAGE_NAME = casa.sif

all: docker_build singularity_convert download_casa

download_casa: casa-6.4.1-12-pipeline-2022.2.0.64-py3.6.tar.xz
	wget https://casa.nrao.edu/download/distro/casa-pipeline/release/linux/casa-6.4.1-12-pipeline-2022.2.0.64-py3.6.tar.xz

# Build Docker container
docker_build:
	docker build -t $(DOCKER_IMAGE_NAME):$(DOCKER_TAG) -f Dockerfile .

# Convert Docker container to Singularity image
singularity_convert:
	singularity build $(SINGULARITY_IMAGE_NAME) docker-daemon://$(DOCKER_IMAGE_NAME):$(DOCKER_TAG)

clean:
	docker rmi $(DOCKER_IMAGE_NAME):$(DOCKER_TAG)
	rm -f $(SINGULARITY_IMAGE_NAME)

.PHONY: all docker_build singularity_convert clean

# Variables for local registry
LOCAL_REGISTRY = meet.batleth.ph1.uni-koeln.de
DOCKER_IMAGE_REGISTRY_NAME = $(LOCAL_REGISTRY)/$(DOCKER_IMAGE_NAME)

# Push to local registry
push_to_registry:
	docker tag $(DOCKER_IMAGE_NAME):$(DOCKER_TAG) $(DOCKER_IMAGE_REGISTRY_NAME):$(DOCKER_TAG)
	docker push $(DOCKER_IMAGE_REGISTRY_NAME):$(DOCKER_TAG)

.PHONY: push_to_registry
