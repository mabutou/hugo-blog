---
title: "macOS 小脚本-批量复制指定目录下特定类型文件"
date: 2019-09-18T19:53:55+08:00
categories: ['Tech']
---

> github: [https://github.com/mabutou/macOS\_copyScript](https://github.com/mabutou/macOS_copyScript)

### 使用场景：

比如我想将某个目录下的几百个 .md 文件（分布在数十个多级子文件夹内），全部集中到一个单独的文件夹内。

*   Linux 系统上可以用一条 find 和 cp 组合命令直接完成。
*   然而 macOS 上命令貌似不太兼容，就写了个小脚本，只在 Mac 上试了，Linux 估计也适用。

### 使用方法：

*   按个人需求修改下方脚本内对应的路径和格式名。创建成 sh 文件放到对应目录。比如叫 [copyScript.sh](http://copyscript.sh/)。
*   若要保留文件夹层级，只是为了过滤文件。则删除倒数 7、8 行注释，同时注释掉倒数第 5 行。
*   使用 sh [copyScript.sh](http://copyscript.sh/) 命令执行即可。

``` bash
#!/bin/bash
#修改IFS变量，将分割字段的字符改为换行符，默认IFS变量含有空格，后续命令会识别不了含有空格的文件夹和文件名
IFS=$'\\n'
#递归过滤当前目录及子目录的所有指定格式文件，默认为md，按需修改
head\_files=\`find ./ -name "\*.md" -print\`
#设置目标文件夹
des\_dir="/Users/XXX/Downloads/md"
echo $des\_dir
#如果没有对应目标文件夹就创建
\[ -d $des\_dir \] || mkdir -p $des\_dir &> /dev/null
#按行读取文件路径
for file in $head\_files
do
source\_dir=${file#./}
echo $source\_dir;
#是否保留文件夹层级
#\[ -d $des\_dir$source\_dir \] || mkdir -p $des\_dir$source\_dir
#cp -p "$file" $des\_dir$source\_dir
#执行复制命令
cp -p "$file" $des\_dir
((file\_count++))
done
echo "复制完毕?"
echo "文件总数：${file\_count} ?"
```