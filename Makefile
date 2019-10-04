REPO=floriandahlitz/docker-calibre

build:
	docker build -t $(REPO):latest .
ifndef BUILD_NUM
	$(warning No build number is defined, skipping build number tag.)
else
	docker build -t $(REPO):$(BUILD_NUM) .	
endif

test:
	./tests/basics.test.sh

deploy: 
	docker push $(REPO):latest
ifndef BUILD_NUM
	$(warning No build number is defined, skipping push of build number tag.)
else
	docker push $(REPO):$(BUILD_NUM)
endif
