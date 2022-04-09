# source [pypi-mirror](https://yeasy.gitbook.io/docker_practice/install/mirror)
use once
```bash
$ pip install -i https://pypi.tuna.tsinghua.edu.cn/simple some-package
```

permently use mirror
```bash
$ python -m pip install --upgrade pip
$ pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
```
