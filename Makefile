# ==================================================
# Terraform Multi-Environment Makefile (Cloudflare)
# ==================================================

# Available environments
ENVIRONMENTS := dev prod

# Helper function to load env vars and run command
define run-with-env
	@if [ -f environments/$(1)/.env ]; then \
		echo "Loading env vars from environments/$(1)/.env"; \
		set -a && . environments/$(1)/.env && set +a && $(2); \
	else \
		echo "⚠️  No .env found in environments/$(1). Using existing env vars."; \
		$(2); \
	fi
endef

# Pattern rules for all environments
%-init:
	$(call run-with-env,$*,terraform -chdir=environments/$* init -backend-config="endpoint=https://$$TF_VAR_account_id.r2.cloudflarestorage.com")

%-plan:
	$(call run-with-env,$*,terraform -chdir=environments/$* plan -out="terraform.tfplan")

%-apply:
	$(call run-with-env,$*,terraform -chdir=environments/$* apply "terraform.tfplan")

%-destroy:
	$(call run-with-env,$*,terraform -chdir=environments/$* destroy)

%-validate:
	$(call run-with-env,$*,terraform -chdir=environments/$* validate)

%-fmt:
	terraform -chdir=environments/$* fmt -recursive

# Utility commands
.PHONY: help list-envs plan-all fmt-all validate-all clean
help:
	@echo "Available commands:"
	@echo "  <env>-init     - Initialize Terraform for environment"
	@echo "  <env>-plan     - Plan changes for environment"  
	@echo "  <env>-apply    - Apply changes for environment"
	@echo "  <env>-destroy  - Destroy infrastructure for environment"
	@echo "  <env>-validate - Validate Terraform configuration"
	@echo "  <env>-fmt      - Format Terraform files"
	@echo ""
	@echo "Available environments: $(ENVIRONMENTS)"
	@echo ""
	@echo "Utility commands:"
	@echo "  plan-all      - Plan for all environments"
	@echo "  fmt-all       - Format all environments"
	@echo "  validate-all  - Validate all environments"

list-envs:
	@echo "Available environments: $(ENVIRONMENTS)"

plan-all:
	@$(foreach env,$(ENVIRONMENTS),echo "=== Planning $(env) ===" && $(MAKE) $(env)-plan;)

fmt-all:
	@$(foreach env,$(ENVIRONMENTS),echo "=== Formatting $(env) ===" && $(MAKE) $(env)-fmt;)

validate-all:
	@$(foreach env,$(ENVIRONMENTS),echo "=== Validating $(env) ===" && $(MAKE) $(env)-validate;)


# Prevent Make from trying to create files with these names
$(ENVIRONMENTS):
	@echo "Did you mean: $@-plan, $@-apply, $@-init, or $@-destroy?"