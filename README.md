# Docker pyQT5 Spiders image 镜像

[![last-commit](https://img.shields.io/github/last-commit/HollowMan6/docker-pyqt5-spiders)](../../graphs/commit-activity)
[![](https://images.microbadger.com/badges/image/hollowman6/docker-pyqt5-spiders.svg)](https://microbadger.com/images/hollowman6/docker-pyqt5-spiders)

[![Followers](https://img.shields.io/github/followers/HollowMan6?style=social)](https://github.com/HollowMan6?tab=followers)
[![watchers](https://img.shields.io/github/watchers/HollowMan6/docker-pyqt5-spiders?style=social)](../../watchers)
[![stars](https://img.shields.io/github/stars/HollowMan6/docker-pyqt5-spiders?style=social)](../../stargazers)
[![forks](https://img.shields.io/github/forks/HollowMan6/docker-pyqt5-spiders?style=social)](../../network/members)

[![Open Source Love](https://img.shields.io/badge/-%E2%9D%A4%20Open%20Source-Green?style=flat-square&logo=Github&logoColor=white&link=https://hollowman6.github.io/fund.html)](https://hollowman6.github.io/fund.html)
[![GPL Licence](https://img.shields.io/badge/license-GPL-blue)](https://opensource.org/licenses/GPL-3.0/)
[![Repo-Size](https://img.shields.io/github/repo-size/HollowMan6/docker-pyqt5-spiders.svg)](../../archive/master.zip)

My docker image to run my Python based APPs / Spiders. 

运行我的Python程序/爬虫的Docker镜像

Tested on Ubuntu

经过测试，在Ubuntu上可用

https://github.com/HollowMan6/docker-pyqt5-spiders

https://hub.docker.com/r/hollowman6/docker-pyqt5-spiders

## How to use it 使用方法

**Run 运行**

```bash
docker run -it \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $(pwd)/{{your python files directory}}:/app \
    -e DISPLAY=$DISPLAY \
    -u hollowman \
    hollowman6/docker-pyqt5-spiders python3 /app/{{your python files}}
```

Note: Please replace content `{{...}}` with your own need.

注意：请将`{{...}}`替换为你的需要内容

**Build 创建**

```bash
docker build -t hollowman6/docker-pyqt5-spiders .
```
