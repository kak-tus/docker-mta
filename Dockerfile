FROM alpine:3.4

ENV CONSUL_HTTP_ADDR=
ENV CONSUL_TOKEN=
ENV VAULT_ADDR=
ENV VAULT_TOKEN=

COPY consul-template_0.16.0_SHA256SUMS /usr/local/bin/consul-template_0.16.0_SHA256SUMS

RUN \
  apk add --update-cache curl unzip opensmtpd \

  && cd /usr/local/bin \

  && curl -L https://releases.hashicorp.com/consul-template/0.16.0/consul-template_0.16.0_linux_amd64.zip -o consul-template_0.16.0_linux_amd64.zip \
  && sha256sum -c consul-template_0.16.0_SHA256SUMS \
  && unzip consul-template_0.16.0_linux_amd64.zip \
  && rm consul-template_0.16.0_linux_amd64.zip consul-template_0.16.0_SHA256SUMS \

  && apk del curl unzip && rm -rf /var/cache/apk/*

COPY smtpd.hcl /root/smtpd.hcl
COPY smtpd.conf.template /root/smtpd.conf.template

CMD consul-template -config /root/smtpd.hcl
