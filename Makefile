.PHONY: build-docker
build-docker:
	docker build -t test_onnx .

.PHONY: run-docker
run-docker: build-docker
	docker run -i -t test_onnx
