#!/bin/bash
#修改默认IFS变量，将分割字段的字符换为换行符
IFS=$'\n'
#递归过滤当前目录及子目录的所有指定后缀文件，默认为md
head_files=`find ./ -name "*.md" -print`
#目标文件夹
des_dir="/Users/mabutou/Downloads/doc"
echo $des_dir
#如果没有对应目标文件夹就创建
[ -d $des_dir ] || mkdir -p $des_dir &> /dev/null
#按行读取文件路径
for file in $head_files
do
source_dir=${file#./}
echo $source_dir;
des_path=${file#./%/*}
echo $des_path
#是否保留文件夹层级
[ -d $des_dir$des_path ] || mkdir -p $des_dir$des_path
pandoc -s "$file" -o $des_dir$des_path.docx -c han.css
#执行命令
#pandoc -s m.md -o m.docx -c github.css
    
   ((file_count++))
done
echo "复制完毕😄"
echo "文件总数：${file_count} 📚"


