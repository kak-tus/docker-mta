max_stale = "2m"

template {
  source = "/root/smtpd.conf.template"
  destination = "/etc/smtpd/smtpd.conf"
}

exec {
  command = "smtpd -d"
  splay = "60s"
}
