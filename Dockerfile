FROM arm32v7/alpine:3.10.2
MAINTAINER sximada <50688746+sximada@users.noreply.github.com>

WORKDIR /var/dynamodb_wd
EXPOSE 8000
RUN apk add openjdk8
RUN apk --no-cache add ca-certificates
COPY ./dynamodb_local_latest.tar.gz /tmp/dynamodb_local_latest
RUN tar xfz /tmp/dynamodb_local_latest
RUN apk del ca-certificates 
RUN rm -f /tmp/dynamodb_local_latest
RUN rm -rf /tmp/* /var/cache/apk/*
COPY ./libsqlite4java-linux-arm.so /var/dynamodb_wd/DynamoDBLocal_lib/

ENTRYPOINT ["/usr/bin/java", "-Djava.library.path=/var/dynamodb_wd/DynamoDBLocal_lib", "-jar", "/var/dynamodb_wd/DynamoDBLocal.jar", "-sharedDb"]
CMD ["-port", "8000"]

VOLUME ["/var/dynamodb_local", "/var/dynamodb_wd"]

