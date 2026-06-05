# Makefile for auto-documenting

.DEFAULT_GOAL := help

RESET := \033[00m
BOLD := \033[01m
RED := \033[31m
GREEN := \033[32m
YELLOW := \033[33m
CYAN := \033[36m

.PHONY: help echo-hello

# See https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
define usage
  @printf "$(BOLD)$(YELLOW)Usage:$(RESET)\n" \
  	&& printf "\n" \
   	&& printf "  \$(BOLD)$(GREEN)make\033[0m [$(BOLD)$(CYAN)target$(RESET)] ...\n" \
  	&& printf "\n" \
  	&& printf "$(BOLD)$(YELLOW)Targets:$(RESET)\n" \
  	&& printf "\n"
	@grep -E '^[a-zA-Z0-9_-]+:.*?  ## .*$$' $(MAKEFILE_LIST) \
		| awk 'BEGIN {FS = ":.*?  ## "}; $\
			{printf "  $(BOLD)$(CYAN)%-$(1)s$(RESET) %s\n", $$1, $$2}'
  @printf "\n"
endef

.force: ## irrelevant can remove and use phony for commands instead of this legacy trick to re-run target always

-----:  ## -----------

# Help needs to be first non period-(.)-prefixed target
# to be the default target when running just `make`.
# the value of '12' is just the width of the column of targets
help:  ## Show this help message.
	$(call usage,16)



-----:  ## -----------

echo-hello:  ## Creates the platform scripts tarball used by the ISO.
	printf "hello"


-----:  ## -----------
