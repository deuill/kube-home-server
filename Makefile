# Makefile for Kubernetes Cluster
# Run `make help` for additional information.

# Build dependency graph.
include Makefile.depends

# The Bash environment to include with templates.
TEMPLATE_ENV = $(ROOT_DIR)/.template.env

# The base Docker registry address, used for all images.
DOCKER_REGISTRY = docker.deuill.org

# -------------
# Public rules.
# -------------

IMAGES      = $(shell find $(ROOT_DIR) -name Dockerfile)
DEFINITIONS = $(shell find $(ROOT_DIR) -name *.yaml)
TEMPLATES   = $(shell find $(ROOT_DIR) -name *.yaml.template)

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

$(IMAGES): % : .build/%.t
	@echo "Building Docker image for $(BOLD)$(@D)$(RESET)..."
	@sudo docker build -t $(DOCKER_REGISTRY)/$(@D) $(@D)
	@mkdir -p .build/$(@D) && touch -r $@ $<

$(DEFINITIONS): % : .build/%.t
	@echo "Building definition for $(BOLD)$(@)$(RESET)..."
	@kubectl apply -f $@
	@mkdir -p .build/$(@D) && touch -r $@ $<

$(TEMPLATES): % : .build/%.t
	@echo "Building definition from template $(BOLD)$(@)$(RESET)..."
	@bash -c 'bash <(printf "source $(TEMPLATE_ENV) && cat << __MAKE__\n$$(cat $@)\n__MAKE__\n")' | kubectl apply -f -
	@mkdir -p .build/$(@D) && touch -r $@ $<

# ----------------
# Other directives.
# ----------------

.PHONY: help

# Create or update build tracking files, if needed. Each recipe checks against these files as
# prerequisites, and determines whether the recipe commands need to be executed based on their status.
ifeq ($(FORCE),true)
    $(foreach i,$(MAKECMDGOALS),$(shell rm -f .build/$(i).t))
endif

$(foreach i,$(MAKECMDGOALS), \
$(shell mkdir -p .build/`dirname $(i)`; \
        test $(i) -nt .build/$(i).t && touch .build/$(i).t))

# Empty recipe target for build tracker files.
.build/%.t:;

# Make `help` be the default action when no arguments are passed to `make`.
.DEFAULT_GOAL = help

# The absolute directory of this Makefile.
ROOT_DIR = $(dir $(realpath $(lastword $(MAKEFILE_LIST))))

# Color & style definitions.
BOLD      = \033[1m
UNDERLINE = \033[4m
BLUE      = \033[36m
RESET     = \033[0m
