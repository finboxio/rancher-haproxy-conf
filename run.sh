#!/bin/sh

if [ "$ERROR_URL" != "" ]; then
cat <<ERR > /etc/rancher-conf/haproxy/500.http
HTTP/1.0 500 Internal Server Error
Cache-Control: no-cache
Connection: close
Content-Type: text/html

<html>
  <head><script>window.location = "${ERROR_URL}?href=" + encodeURIComponent(window.location.href)</script></head>
</html>
ERR

cat <<ERR > /etc/rancher-conf/haproxy/502.http
HTTP/1.0 502 Bad Gateway
Cache-Control: no-cache
Connection: close
Content-Type: text/html

<html>
  <head><script>window.location = "${ERROR_URL}?href=" + encodeURIComponent(window.location.href)</script></head>
</html>
ERR

cat <<ERR > /etc/rancher-conf/haproxy/503.http
HTTP/1.0 503 Service Unavailable
Cache-Control: no-cache
Connection: close
Content-Type: text/html

<html>
  <head><script>window.location = "${ERROR_URL}?href=" + encodeURIComponent(window.location.href)</script></head>
</html>
ERR

cat <<ERR > /etc/rancher-conf/haproxy/504.http
HTTP/1.0 504 Gateway Timeout
Cache-Control: no-cache
Connection: close
Content-Type: text/html

<html>
  <head><script>window.location = "${ERROR_URL}?href=" + encodeURIComponent(window.location.href)</script></head>
</html>
ERR
else
wget -O /etc/rancher-conf/haproxy/500.http https://raw.githubusercontent.com/Jonathan-Rosewood/haproxy-custom-errors/master/500.http
wget -O /etc/rancher-conf/haproxy/502.http https://raw.githubusercontent.com/Jonathan-Rosewood/haproxy-custom-errors/master/502.http
wget -O /etc/rancher-conf/haproxy/503.http https://raw.githubusercontent.com/Jonathan-Rosewood/haproxy-custom-errors/master/503.http
wget -O /etc/rancher-conf/haproxy/504.http https://raw.githubusercontent.com/Jonathan-Rosewood/haproxy-custom-errors/master/504.http
fi

if [ "$FALLBACK_URL" != "" ]; then
cat <<ERR > /etc/rancher-conf/haproxy/404.http
HTTP/1.0 404 Not Found
Cache-Control: no-cache
Connection: close
Content-Type: text/html

<html>
  <head><script>window.location = "${FALLBACK_URL}?href=" + encodeURIComponent(window.location.href)</script></head>
</html>
ERR
else
wget -O /etc/rancher-conf/haproxy/404.http https://raw.githubusercontent.com/Jonathan-Rosewood/haproxy-custom-errors/master/503.http
sed -i 's/503/404/g' /etc/rancher-conf/haproxy/404.http
sed -i 's/Service Unavailable/Not Found/g' /etc/rancher-conf/haproxy/404.http
fi

while [ ! -e /etc/rancher-conf/haproxy/haproxy.cfg ]; do
  echo "Waiting for HAProxy config"
  sleep 2
done

exec /usr/local/sbin/haproxy -W -f /etc/rancher-conf/haproxy/haproxy.cfg
