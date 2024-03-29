include scripts/make/common.mk
.SECONDEXPANSION:


TYPE := py
DOCKER := true
ifeq (${DOCKER},true)
  DOCKER_CMD := "--docker"
endif

###############################################################################
##@ Basic
setup: local_setup ## Setup
local_setup: ## Local setup
	@./scripts/bash/$@.sh

###############################################################################
# py
PY_SCRIPT = build docs scan test docker configure publish
PY_SCRIPT_2=$(addprefix py., $(PY_SCRIPT))
PY_PATH := py_app
${PY_SCRIPT_2}: _$$@
_py.%:
	@./scripts/python/$*.sh --path ${PY_PATH} ${DOCKER_CMD}

###############################################################################
##@ Application
.PHONY: build docs scan test env configure publish
build: ${TYPE}.$$@ ## Build
docs: ${TYPE}.$$@ ## Docs
scan: ${TYPE}.$$@ ## Scan
test: ${TYPE}.$$@ ## Test
docker: ${TYPE}.$$@ ## Docker
configure: ${TYPE}.$$@ ## Configure
publish: ${TYPE}.$$@ ## Publish

###############################################################################
##@ Other
.PHONY: run clean
run: ## Run
	@./scripts/python/run.sh --path py_app --app joe_first_test_app
clean: ## Clean
	@./scripts/clean.sh
install: ## Install
