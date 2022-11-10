FROM alpine:latest
RUN apk --update --no-cache add python3 ca-certificates gcc libffi-dev python3-dev musl-dev openssl-dev g++ libxml2-dev\
 libxslt-dev libjpeg-turbo-dev zlib-dev tshark py3-pip rust cargo protobuf
RUN pip install --upgrade pip
RUN pip install mitmproxy jsonpath-ng
COPY bin /bin
ENV LANG=en_US.UTF-8
VOLUME /root/.mitmproxy
EXPOSE 8080
CMD ["mitmproxy"]
