REPO=gcr.io
PROJECT:= $(shell gcloud config get-value project)
PREFIX := ${REPO}/${PROJECT}
TEST_LOGGER_IMAGE := ${PREFIX}/test-logger:v2.0.0
FLUENTD_SIDECAR_IMAGE := ${PREFIX}/fluentd:v1.7.0
export

# You can see envsubsted yaml with this target
deploy:clean
	kubectl apply -f fluentd-configmap.yaml
	cat deployment.yaml | envsubst | tee | kubectl apply -f -
clean:
	-kubectl delete configmap fluentd-config
	-kubectl delete deployment sidecar-example
debug:
	cat deployment.yaml | envsubst
