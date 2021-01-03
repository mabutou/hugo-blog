---
title: "国内主机配置 k8s 的注意事项及如何正确设置代理"
date: 2019-11-23T19:58:29+08:00
categories: ['Tech']
---

> 最近学习 kubernetes，在公司三台 centos7 服务器上用 kubeadm 部署 k8s 测试环境。
> 
> 过程中有些注意事项，提前避开能节省很多时间。

1\. 安装指定 docker 版本

*   kubeadm 对 docker 版本的支持有限，目前只支持到 18.09

*   直接装最新版的会在后面步骤里报错，还得重装一次。

2\. 某些教程里使用的是旧版 kubeadm ，对应的 weave 安装命令也是旧版的

*   我装的最新版 kubeadm (1.16)，发现装 weave 时遇到版本问题。
*   用下面命令装的 ：

```
kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\\n')"
```

**3\. 正确设置代理（重要）。**

*   本来 kubeadm 部署 k8s 很简单，但国内无法正常访问 [gcr.io](http://gcr.io/) 。很多人被拉取 [gcr.io](http://k8s.gcr.io/v2/) 镜像时的网络问题卡住。

*   linux 下在终端用 setproxy 或 sethttp 命令设置的代理对 docker pull 无效。需要额外设置。

### 操作步骤

*   创建目录

```
sudo mkdir -p /etc/systemd/system/docker.service.d
```

*   新建文件，走 http 代理

```
vim /etc/systemd/system/docker.service.d/http-proxy.conf
```

*   内容（ip 和端口号根据客户端设置修改）

```
\[Service\]
Environment="HTTP\_PROXY=http://127.0.0.1:8001/"
```

*   刷新更改

```
sudo systemctl daemon-reload
```

*   重新启动 Docker

```
sudo systemctl restart docker
```

*   验证配置是否已加载

```
systemctl show --property=Environment docker
```

*   如果生效会显示对应设置参数

之后的步骤里就可以 pull [gcr.io](http://gcr.io/) 上的镜像了。

> 详细配置参考官网文档：
> 
> [https://docs.docker.com/config/daemon/systemd/](https://docs.docker.com/config/daemon/systemd/)

注：如果配置的是局域网内其他机器上运行的代理客户端，需要在对应客户端开启局域网共享功能（某些 GUI 客户端没有这个选项，可以手动在配置文件里将本地监听从 127.0.0.1 改成 0.0.0.0 ）。