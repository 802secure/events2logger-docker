# Events2Logger Dockerfile
#
# (c) 2017 802 Secure, Inc.
# All rights reserved

FROM alpine:latest
MAINTAINER 802 Engineering <engineering@802secure.com>

ENV VERSION 1.0.0-beta
ENV EVENTS2LOGGER events2logger-v$VERSION-64-linux
ENV DOWNLOAD_URL https://s3.amazonaws.com/802secure.net-cdn/events2logger/$EVENTS2LOGGER

RUN apk add --update openssl ca-certificates
WORKDIR /events2logger

ADD $DOWNLOAD_URL events2logger 
RUN chmod 755 events2logger
ADD events2logger.yml /events2logger

ENTRYPOINT ["./events2logger", "-v"]
CMD ["run"]

