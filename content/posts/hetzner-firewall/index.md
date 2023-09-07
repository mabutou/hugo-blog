---
title: "Hetzner 独立服务器防火墙规则配置，允许传出连接"
date: 2021-12-21T18:30:00+08:00
---

- Hetzner 独服使用了无状态防火墙，使用常规规则会出现服务器本身无法连接外部网站的情况。
- 因为静态防火墙只能通过检查单独的数据包来决定数据包。因此，防火墙不能“跟踪”传入的数据包是否属于来自服务器的传出连接。由于这个原因，除非您输入一个额外的规则，否则来自服务器的所有传出连接都将无法工作。
- 对应图中最后一条规则。

{{< img src="/posts/hetzner-firewall/hetzner.png" >}}


原文：

[Firewall - Hetzner Docs](https://docs.hetzner.com/robot/dedicated-server/firewall/)

### Out-going TCP connections

A static firewall only *makes decisions* about packets by inspecting individual packets. Therefore, the firewall doesn't "keep track of" whether or not an incoming packet belongs to an outgoing connection from the server. For this reason, unless you enter an additional rule, all outgoing connections from the server will not work. Server services (for example, enabling webservers for port 80) are not affected.

You can use the following rule to generally allow all responses to TCP connections:

```other
Source IP: No entry
 Destination IP: No entry
 Source port: No entry
 Destination port: 32768-65535 (Ephemeral Port Range)
 Protocol: tcp
 TCP flags: ack
 Action: accept
```

