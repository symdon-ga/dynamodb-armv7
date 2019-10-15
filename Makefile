IMAGE := sximada/rpi-dynamodb-local:201910.02

.PHONY: build
build: download
	docker buildx build -t $(IMAGE) --push --platform linux/arm/v7 .

.PHONY: download
download: dynamodb_local_latest.tar.gz libsqlite4java-linux-arm.so
	echo downloaded

dynamodb_local_latest.tar.gz:
	wget https://s3-us-west-2.amazonaws.com/dynamodb-local/dynamodb_local_latest.tar.gz

libsqlite4java-linux-arm.so:
	wget https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/sqlite4java/libsqlite4java-linux-arm.so
