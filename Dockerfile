FROM python:3.11-slim as builder

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt-get update && \
    apt-get install -y --no-install-recommends gcc

RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

COPY requirements.txt .
RUN pip install -r requirements.txt --no-cache-dir

FROM alpine:3.17.0

ENV LANG=en_US.UTF-8
ENV PATH="/opt/venv/bin:$PATH"

COPY --from=builder /opt/venv /opt/venv

RUN echo -e "http://dl-cdn.alpinelinux.org/alpine/edge/testing\nhttp://dl-cdn.alpinelinux.org/alpine/edge/main\nhttp://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories &&\
  apk --update --no-cache add \
  protobuf \
  mitmproxy \
  py3-pip

VOLUME /root/.mitmproxy
EXPOSE 8080
CMD ["tail", "-f", "/dev/null"]
