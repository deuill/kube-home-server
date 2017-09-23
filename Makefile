# Makefile for Kubernetes Cluster
# Run `make help` for additional information.

# The base Docker registry address, used for all images.
DOCKER_REGISTRY = "docker.deuill.org"

# The Bash environment to include with templates.
TEMPLATE_ENV = "$(ROOT_DIR)/Makefile.template.env"

# -------------
# Public rules.
# -------------

IMAGES = $(wildcard */*/Dockerfile)
DEFINITIONS = $(wildcard */*/*.yaml */*.yaml)
TEMPLATES = $(wildcard */*/*.yaml.template */*.yaml.template)

## Build all available Docker images.
images: $(IMAGES)

## Show usage information for this Makefile.
help:
	@printf "$(BOLD)Kubernetes Cluster Setup$(RESET)\n\n"
	@printf "This Makefile contains tasks for processing auxiliary actions, such as\n"
	@printf "building and deploying Docker images and Kubernetes services.\n\n"
	@printf "$(UNDERLINE)Available Tasks$(RESET)\n\n"
	@awk -F ':|##' '/^##/ {c=$$2; getline; printf "$(BLUE)%8s$(RESET) %s\n", $$1, c}' $(MAKEFILE_LIST)
	@printf "\n"

# --------------
# Private rules.
# --------------

$(IMAGES):
	@echo "Building Docker image for $(BOLD)$(@D)$(RESET)..."
	@sudo docker build -t $(DOCKER_REGISTRY)/$(@D) $(@D)

$(DEFINITIONS):
	@echo "Building definition for $(BOLD)$(@)$(RESET)..."
	@kubectl apply -f $@

$(TEMPLATES):
	@echo "Building definition from template $(BOLD)$(@)$(RESET)..."
	@bash -c 'bash <(printf "source $(TEMPLATE_ENV) && cat << __MAKE__\n$$(cat $@)\n__MAKE__\n")' | kubectl apply -f -

# ----------------
# Other directives.
# ----------------

.PHONY: $(IMAGES) $(DEFINITIONS) $(TEMPLATES) images help

# Make `help` be the default action when no arguments are passed to `make`.
.DEFAULT_GOAL = help

# The absolute directory of this Makefile.
ROOT_DIR = $(dir $(realpath $(lastword $(MAKEFILE_LIST))))

# Color & style definitions.
BOLD      = \033[1m
UNDERLINE = \033[4m
BLUE      = \033[36m
RESET     = \033[0m
