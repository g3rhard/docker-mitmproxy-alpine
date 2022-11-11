FROM alpine:3.16.2
RUN apk --update --no-cache add \
  python3 ca-certificates py3-pip protobuf
RUN apk --update --no-cache add \
  py3-zstandard --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community/
RUN apk --update --no-cache add \
  mitmproxy --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir jsonpath-ng
ENV LANG=en_US.UTF-8
VOLUME /root/.mitmproxy
EXPOSE 8080
CMD ["tail", "-f", "/dev/null"]
