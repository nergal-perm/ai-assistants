# Include .env file if it exists
-include .env
export

.PHONY: deploy-strategist deploy-to-exocortex clean-exocortex

deploy-strategist:
	@echo "Deploying strategist workflows..."
	@mkdir -p $(DEPLOY_TARGET)
	@rsync -a --exclude='*.sop.md' strategist/agy-workflows/ $(DEPLOY_TARGET)/
	@find strategist/agy-workflows -name '*.sop.md' -type f | while read file; do \
		relative=$$(echo $$file | sed 's|strategist/agy-workflows/||'); \
		target=$$(echo $$relative | sed 's|\.sop\.md$$|.md|'); \
		mkdir -p $(DEPLOY_TARGET)/$$(dirname $$target); \
		cp $$file $(DEPLOY_TARGET)/$$target; \
	done
	@echo "✓ Strategist workflows deployed successfully to $(DEPLOY_TARGET)"

clean-exocortex:
	@echo "Cleaning target folder..."
	@rm -rf $(DEPLOY_TARGET)/*
	@echo "✓ Target folder cleared"

deploy-to-exocortex: clean-exocortex deploy-strategist
	@echo "✓ All deployments to exocortex completed"
