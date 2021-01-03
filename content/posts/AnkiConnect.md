---
title: "Mac 版 Anki 安装 AnkiConnect 插件后连接失败解决方法"
date: 2018-11-15T19:39:14+08:00
categories: ['Tech']
---

### 最近使用 Anki 记忆 COCA 词汇时，碰到此问题。

*   使用 Chrome 上的 Anki 取词插件（比如我用的 Online Dictionary Helper） 时，将单词添加至新卡片的功能需要依靠 AnkiConnect 插件连接桌面客户端与取词插件。
*   由于 Mac 系统的机制，会导致 Anki 客户端处于后台时，AnkiConnect 的进程被挂起。
*   结果是取词插件设置页面检测不到 AnkiConnect，或者检测到并设置好后短时间内连接又断开。
*   打开终端执行下面三行命令

解决方法如下：

``` bash
defaults write net.ankiweb.dtop NSAppSleepDisabled -bool true
defaults write net.ichi2.anki NSAppSleepDisabled -bool true
defaults write org.qt-project.Qt.QtWebEngineCore NSAppSleepDisabled -bool true
```

*   重启 Anki 客户端

[官方文档原文：](https://foosoft.net/projects/anki-connect/index.html#notes-for-mac-os-x-users)
----------------------------------------------------------------------------------------

### Notes for Mac OS X Users

Starting with [Mac OS X Mavericks](https://en.wikipedia.org/wiki/OS_X_Mavericks), a feature named _App Nap_ has been introduced to the operating system. This feature causes certain applications which are open (but not visible) to be placed in a suspended state. As this behavior causes AnkiConnect to stop working while you have another window in the foreground, App Nap should be disabled for Anki:

1.  Start the Terminal application.
2.  Execute the following commands in the terminal window:
    *   `defaults write net.ankiweb.dtop NSAppSleepDisabled -bool true`
    *   `defaults write net.ichi2.anki NSAppSleepDisabled -bool true`
    *   `defaults write org.qt-project.Qt.QtWebEngineCore NSAppSleepDisabled -bool true`
3.  Restart Anki.