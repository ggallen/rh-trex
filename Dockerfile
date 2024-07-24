FROM registry.access.redhat.com/ubi9/ubi-minimal:9.4-1194

RUN \
    microdnf install -y \
    util-linux \
    && \
    microdnf clean all

RUN mkdir /usr/local/bin/rh-trex
COPY \
    * \
    /usr/local/bin/rh-trex

EXPOSE 8000

ENTRYPOINT ["/usr/local/bin/rh-trex", "serve"]

LABEL name="trex" \
      vendor="Red Hat" \
      version="0.0.1" \
      summary="rh-trex API" \
      description="rh-trex API"
