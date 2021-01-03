---
title: "Fix Lvreduce"
date: 2020-12-21T17:27:15+08:00
draft: true
categories: ['Tech']
---

使用 lvreduce 命令进行逻辑卷缩容时报错，提示 busy。
我直接先手动缩容后，再执行 resize命令。
此时会提示，
reboot后机器失联，发工单开启kvm后看到时superblock 丢失。启动失败。
在这篇回答里找到了答案。
