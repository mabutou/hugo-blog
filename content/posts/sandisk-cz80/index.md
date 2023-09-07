---
title: "Mac OS 下解决 SanDisk CZ80 掉速问题"
date: 2017-11-09T19:28:23+08:00
categories: ['Tech']
---

*   CZ80 速度很快可以用来做 win to go 系统。但由于主控原因，用久了会明显掉速。
*   想要恢复原本速度，可以直接全盘写零进行还原。格式化是没用的。

命令步骤如下：

在终端中查询磁盘编号：

``` bash diskutil list ```

确认编号（如 diskX）后（注意大小写），全盘写零：

``` bash diskutil zeroDisk /dev/diskX ```

过程可能有点慢，进度条走完就好了。