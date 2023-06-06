CH_DIR = charts/
DIR = pulsar
VERSION = ${TAG}
# PACKAGED_CHART = ${DIR}-${VERSION}.tgz

push-chart:
	@echo "=== changing directory ==="
	cd ${CH_DIR}
	@echo "=== save chart ==="
	helm chart save ${DIR}/ $(ECR_HOST)/dataos-base-charts:${DIR}-${VERSION}
	@echo
	@echo "=== push chart ==="
	helm chart push $(ECR_HOST)/dataos-base-charts:${DIR}-${VERSION}
	@echo
	@echo "=== logout of registry ==="
	helm registry logout $(ECR_HOST)




# dev release:
# 	docker run --rm -it -v `pwd`:/home/build/working_dir -v ~/.gitconfig:/home/build/.gitconfig -v ~/.ssh:/home/build/.ssh rubiklabs/builder:0.4.0 dev patch DIRECTORY_OF_CHART
# public release:
# 	docker run --rm -it -v `pwd`:/home/build/working_dir -v ~/.gitconfig:/home/build/.gitconfig -v ~/.ssh:/home/build/.ssh rubiklabs/builder:0.4.0 public patch DIRECTORY_OF_CHART