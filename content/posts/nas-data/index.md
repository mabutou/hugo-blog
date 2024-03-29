---
title: "群晖系统提示硬盘损毁后提取硬盘数据"
date: 2019-10-22T19:56:47+08:00
categories: ['Tech']
---

群晖系统在安装新硬盘时需要进行硬盘的初始化，支持 ext4 或者 btrfs 两种文件系统。（我用的 brtfs）

群晖在检测到硬盘健康状况不太好时，容易提示硬盘损毁，此时在群晖系统内无法读写硬盘内容了。一般重新格式化或者修复下坏道就能继续正常用。

此时如果想要先取出其中的文件只能用其他系统。这两种格式都不能直接在 Mac 系统或者 windows 系统里正常读取。

不过可以用 Linux 系统读取。

以 Ubuntu 为例：

使用虚拟机直接装一个 Ubuntu。或者制作 u 盘启动盘，进入 _LiveCD_ 模式启动电脑。

推荐使用虚拟机

我用的 Mac 上的 Parallels，VMware 当然也行。

进入系统后打开终端并以 root 身份（sudo -i）执行以下操作：

*   `apt-get update`
*   `apt-get install mdadm lvm2 btrfs-prog`
*   `mdadm -Asf && vgchange -ay`

然后在文件管理器内就能看到对应的盘，文件数量少的话，直接手动选择复制就行。

> **以上步骤随手一谷歌就能在网上找到，以下才是重点。**

在文件浏览器里可以直接批量复制，刚开始我是 smb 协议链接到 nas 去，进行远程复制。

然而会遇到 @开头的文件夹，此时会提示是否跳过，这种文件夹很多，一直点很烦，不点就会卡在那。而且测试后发现，smb 协议速度一般。

**所以我直接先用 Mac 的 Finder 用 afp 协议链接到 nas，在 Ubuntu 终端内用 rsync 复制的，直接排除掉 @开头文件夹，速度也快很多。**

*   命令大概如下，排除掉特殊文件夹。并远程连接到 Mac 挂载好的 nas。

*   其中第一个 xxx 代表你要复制的文件夹，/Volumes/nas/xxx 是 nas 内的目标文件夹

*   mabutou@192.168.1.100 代表 Mac 的局域网 ssh 用户名和地址（需要提前开启 ssh 功能，系统设置里就能直接打开）

```
rsync -ruv --progress --exclude='@eaDir' xxx mabutou@192.168.1.100:/Volumes/nas/xxx
```

然后坐等复制完成就行。