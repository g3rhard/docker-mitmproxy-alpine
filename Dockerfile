FROM alpine:3.16.2
RUN apk --update --no-cache add \
  python3 ca-certificates gcc libffi-dev python3-dev musl-dev openssl-dev g++ libxml2-dev \
  libxslt-dev libjpeg-turbo-dev zlib-dev tshark py3-pip rust cargo protobuf
RUN pip install --upgrade pip
RUN pip install --no-cache-dir mitmproxy jsonpath-ng
ENV LANG=en_US.UTF-8
VOLUME /root/.mitmproxy
EXPOSE 8080
CMD ["mitmproxy"]
