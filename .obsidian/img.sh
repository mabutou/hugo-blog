#!/bin/sh
#修改默认IFS变量，将分割字段的字符换为换行符
IFS=$'\n'
#递归过滤当前目录及子目录的所有指定格式文件，默认为md，按需修改
# head_files=`find /Users/mabutou/Library/Mobile\ Documents/iCloud\~md\~obsidian/Documents/Chaos -name "*.jpeg" -o -name "*.png" -o -name "*.jpg" ! -path '*/img\&file/*' ! -path '*/.trash/*' -print`
head_files=`gfind /Users/mabutou/Library/Mobile\ Documents/iCloud\~md\~obsidian/Documents/Chaos -regextype "posix-egrep" -regex "(.*?)\.(png|jpe?g|gif|bmp|psd|tiff|tga|eps)" ! -path '*/img\&file/*' ! -path '*/.trash/*' -print`
# head_files=`gfind /Users/mabutou/Library/Mobile\ Documents/iCloud\~md\~obsidian/Documents/Chaos -regextype "posix-egrep" -regex "(.*?)\.(png|jpe?g|gif|bmp|psd|tiff|tga|eps)" ! -path '*/img\&file/*' ! -path '*/.trash/*' -printf "\"%p\"\n"`
#设置目标文件夹
des_dir="/Users/mabutou/Library/Mobile\ Documents/iCloud\~md\~obsidian/Documents/Chaos/img\&file/"
echo $des_dir
#如果没有对应目标文件夹就创建
[ -d $des_dir ] || mkdir -p $des_dir &> /dev/null
#按行读取文件路径
for file in $head_files
do
source_dir=${file#./}
echo $source_dir;
#是否保留文件夹层级
#[ -d $des_dir$source_dir ] || mkdir -p $des_dir$source_dir
#cp -p "$file" $des_dir$source_dir
#执行复制命令
cp -p $file $des_dir
((file_count++))
done
echo "复制完毕😄"
echo "文件总数：${file_count} 📚"
