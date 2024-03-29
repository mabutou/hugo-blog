---
title: "解决 vultr 恢复历史快照后，莫名断网问题"
date: 2019-10-22T19:57:38+08:00
categories: ['Tech']
---

> **这算是 vultr 机器的老问题了，不明白为啥 vultr 一直没解决。**

**起因**
------

*   之前服务器中了一个俄罗斯的病毒，其实没啥影响，几下解决后，总感觉不舒服可能有其他残留毒素。

*   看了下最新的快照列表，中毒前后没什么大的数据更改。干脆直接恢复快照好了。

经过
--

*   以前也恢复过很多次快照，很顺利，这次恢复后，ssh 直接连不上。

*   用 ping 工具测试，发现无论海内还是海外，一片红。那显然是机器出问题了。

*   无奈只好进 vultr 后台用 vnc 方式登陆。

*   **搞半天没解决。一谷歌是 vultr 老问题了，恢复快照后，偶尔会发生网卡异常。**

### 需要手动修改下配置文件。

这篇文章里有详细分析和解决过程 [https://zhuanlan.zhihu.com/p/52989069](https://zhuanlan.zhihu.com/p/52989069)

Centos 配置文件和 Ubuntu/Debian 略有不同。

手动修改步骤谷歌能找到对应的一堆文章，我就不写了。（主要是懒，有空闲的时候再补上吧）

结果
--

这次修复好了，以后还是有几率出现同样问题。

所以最好在机器正常时放一个修复脚本再创建快照，免去后顾之忧。快照本身如果没有这个脚本，恢复后遇到断网也是不能直接连到外网下载脚本的。

脚本地址：[https://github.com/leitbogioro/fix\_deviant\_NIC](https://github.com/leitbogioro/fix_deviant_NIC)