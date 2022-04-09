# source [docker-mirror](https://yeasy.gitbook.io/docker_practice/install/mirror)
write above content to path `/etc/docker/daemon.json`
```json
{
  "registry-mirrors": [
    "https://hub-mirror.c.163.com",
    "https://mirror.baidubce.com"
  ]
}
```

reload and restart docker daemon
```bash
$ sudo systemctl daemon-reload
$ sudo systemctl restart docker
```

check mirror
```
$ docker info
```
