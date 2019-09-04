REPO=gcr.io
PROJECT:= $(shell gcloud config get-value project)
PREFIX := ${REPO}/${PROJECT}
TEST_LOGGER_IMAGE := ${PREFIX}/test-logger:v2.0.0
FLUENTD_SIDECAR_IMAGE := ${PREFIX}/fluentd-sidecar:v1.0.0
export

# You can see envsubsted yaml with this target
debug:
	cat deployment.yaml | envsubst
deploy:delete
	kubectl apply -f fluentd-configmap.yaml
	cat deployment.yaml | envsubst | tee | kubectl apply -f -
delete:
	-kubectl delete configmap fluentd-config
	-kubectl delete deployment sidecar-example
