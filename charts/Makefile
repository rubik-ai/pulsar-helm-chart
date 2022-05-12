push-chart-aws:
	@echo
	@echo "=== login to registry ==="
	aws ecr get-login-password --region $(ECR_REGION) | helm registry login $(ECR_HOST) --username $(ECR_USERNAME) --password-stdin --debug
	@echo
	@echo "=== save chart ==="
	helm chart save pulsar/ $(ECR_HOST)/dataos-base-charts:pulsar-2.8.1-d2
	@echo
	@echo "=== push chart ==="
	helm chart push $(ECR_HOST)/dataos-base-charts:pulsar-2.8.1-d2
	@echo
	@echo "=== logout of registry ==="
	helm registry logout $(ECR_HOST)