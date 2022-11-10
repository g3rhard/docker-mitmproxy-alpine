FROM alpine:3.16.2
RUN apk --update --no-cache add \
  python3 ca-certificates py3-pip mitmproxy protobuf
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir jsonpath-ng
ENV LANG=en_US.UTF-8
VOLUME /root/.mitmproxy
EXPOSE 8080
CMD ["mitmproxy"]
