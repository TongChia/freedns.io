freedns.io docker
===
用于自动使用本机 ipv6 地址更新 freedns.io

USAGE
---
```bash
docker run -it --net=host -e USER=${USERNAME} -e PASSWORD=${PASSWORD} -e HOSTNAME=${HOSTNAME} -e INTERVALL=300 -e HOSTTYPE=AAAA ${IMAGE}
```

