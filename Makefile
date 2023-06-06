CH_DIR = charts
DIR = pulsar
VERSION = ${TAG}
PACKAGED_CHART = ${DIR}-${VERSION}.tgz


push-chart:
    @echo "=== Helm login ==="
    aws ecr get-login-password --region ${AWS_DEFAULT_REGION} | helm registry login ${ECR_HOST} --username AWS --password-stdin --debug
    @echo "=== save chart ==="
    helm chart save ${CH_DIR}/${DIR}/ $(ECR_HOST)/dataos-base-charts:${DIR}-${VERSION}
    @echo
    @echo "=== push chart ==="
    helm chart push $(ECR_HOST)/dataos-base-charts:${DIR}-${VERSION}
    @echo
    @echo "=== logout of registry ==="
    helm registry logout $(ECR_HOST)

push-chart-oci:
    @echo "=== Helm login ==="
	aws ecr get-login-password --region ${AWS_REGION} | helm registry login --username AWS --password-stdin $(ECR_HOST)
	@echo "=== package chart ==="
	helm package ${CH_DIR}/${DIR} --version ${VERSION}
	@echo
	@echo "=== push chart ==="
	helm push ${PACKAGED_CHART} oci://$(ECR_HOST)/dataos-base-charts
	@echo
	@echo "=== logout of registry ==="
	helm registry logout $(ECR_HOST)



# dev release:
# 	docker run --rm -it -v `pwd`:/home/build/working_dir -v ~/.gitconfig:/home/build/.gitconfig -v ~/.ssh:/home/build/.ssh rubiklabs/builder:0.4.0 dev patch DIRECTORY_OF_CHART
# public release:
# 	docker run --rm -it -v `pwd`:/home/build/working_dir -v ~/.gitconfig:/home/build/.gitconfig -v ~/.ssh:/home/build/.ssh rubiklabs/builder:0.4.0 public patch DIRECTORY_OF_CHART