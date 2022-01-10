FROM alpine:3.15

RUN \
  apk add --no-cache opensmtpd

CMD ["smtpd", "-d"]
