export CONTAINER_IMAGE = 'camera'

default: build test

build:
	docker build -t ${CONTAINER_IMAGE} .

test: test1 test2

test1:
	@echo "test still"
	@docker run --rm -it \
	--volume /opt/vc:/opt/vc \
	--device /dev/vchiq \
	-e LD_LIBRARY_PATH=/opt/vc/lib \
	${CONTAINER_IMAGE} \
	/opt/vc/bin/raspistill -o output.jpg
test2:
	@echo "test still"
	@docker run --rm -it \
	--volume /opt/vc:/opt/vc \
	--device /dev/vchiq \
	-e LD_LIBRARY_PATH=/opt/vc/lib \
	${CONTAINER_IMAGE} \
	node takeStill.js