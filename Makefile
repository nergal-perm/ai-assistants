# Include .env file if it exists
-include .env
export

.PHONY: deploy-strategist deploy-to-exocortex

deploy-strategist:
	@echo "Deploying strategist workflows..."
	@mkdir -p $(DEPLOY_TARGET)
	@cp -r strategist/agy-workflows/* $(DEPLOY_TARGET)/
	@echo "✓ Strategist workflows deployed successfully to $(DEPLOY_TARGET)"

deploy-to-exocortex: deploy-strategist
	@echo "✓ All deployments to exocortex completed"
