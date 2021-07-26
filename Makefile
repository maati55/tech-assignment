SHELL := /bin/bash

.PHONY: help azure_aks data

BOLD=$(shell tput bold)
RED=$(shell tput setaf 1)

TF_ACTION ?= apply
TF_VARS ?= "../envs/${WORKSPACE}.tfvars"

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

check: ## checks to see all required env vars are set
	@if [ -z $(WORKSPACE) ]; then \
		echo "$(BOLD)$(RED)WORKSPACE was not set$(RESET)"; \
		ERROR=1; \
	fi

	@if [ -z $(TF_STATE_STORAGE_ACCOUNT) ]; then \
		echo "$(BOLD)$(RED)TF_STATE_STORAGE_ACCOUNT was not set.$(RESET)"; \
		ERROR=1; \
	fi

	@if [ -z $(TF_STATE_RESOURCE_GROUP) ]; then \
		echo "$(BOLD)$(RED)TF_STATE_RESOURCE_GROUP was not set.$(RESET)"; \
		ERROR=1; \
	fi

	@if [ -z $(TF_STATE_CONTAINER) ]; then \
		echo "$(BOLD)$(RED)TF_STATE_CONTAINER was not set.$(RESET)"; \
		ERROR=1; \
	fi
	@if [[ $${ERROR} -eq 1 ]]; then \
		echo "$(BOLD)Example usage: \`ENVIRONMENT=dev PROJECT=maatiss REGION=uksouth make apply\`$(RESET)"; \
		exit 1; \
	fi

tf: check
	@cd $(DIR) && \
	find ./.terraform -mindepth 1 ! -regex '^./.terraform/providers\(/.*\)?' -delete || true && \
	terraform init -backend-config=storage_account_name=$(TF_STATE_STORAGE_ACCOUNT) -backend-config=resource_group_name=$(TF_STATE_RESOURCE_GROUP) \
	-backend-config=container_name=$(TF_STATE_CONTAINER) && \
	terraform workspace select $(WORKSPACE) || terraform workspace new $(WORKSPACE) && \
	terraform $(TF_ACTION) -var-file="$(TF_VARS)" -refresh=false -compact-warnings && \
	find ./.terraform -mindepth 1 ! -regex '^./.terraform/providers\(/.*\)?' -delete

azure_aks: ## runs the azure_aks terraform play.
	@DIR=$@ $(MAKE) tf

data: ## runs the azure_hub terraform play.
	@DIR=$@ $(MAKE) tf
