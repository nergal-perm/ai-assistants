# Include .env file if it exists
-include .env
export

.PHONY: deploy-strategist deploy-to-exocortex clean-exocortex

deploy-strategist:
	@echo "Deploying strategist workflows..."
	@mkdir -p $(DEPLOY_TARGET)/workflows
	@cp -r strategist/agy-workflows/kb-strategist $(DEPLOY_TARGET)/
	@find strategist/agy-workflows -maxdepth 1 -name '*.md' ! -name '*.sop.md' -type f -exec cp {} $(DEPLOY_TARGET)/workflows/ \;
	@find strategist/agy-workflows -maxdepth 1 -name '*.sop.md' -type f | while read file; do \
		basename=$$(basename $$file .sop.md); \
		cp $$file $(DEPLOY_TARGET)/workflows/$$basename.md; \
	done
	@echo "✓ Strategist workflows deployed successfully to $(DEPLOY_TARGET)"

clean-exocortex:
	@echo "Cleaning target folder..."
	@rm -rf $(DEPLOY_TARGET)/*
	@echo "✓ Target folder cleared"

deploy-to-exocortex: clean-exocortex deploy-strategist
	@echo "✓ All deployments to exocortex completed"
