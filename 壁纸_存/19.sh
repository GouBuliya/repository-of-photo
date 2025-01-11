#!/bin/bash

# 目标文件夹路径
folder="/home/li-xufeng/Pictures/壁纸_存"  # 替换为你自己的文件夹路径
counter=1

# 遍历文件夹中的所有文件
for file in "$folder"/*; do
    # 检查是否是文件（排除文件夹）
    if [[ -f "$file" ]]; then
        # 获取文件的扩展名
        extension="${file##*.}"
        # 获取文件的新名称
        new_name="$folder/$counter.$extension"
        # 重命名文件
        mv "$file" "$new_name"
        echo "Renamed: $file -> $new_name"
        # 增加计数器
        counter=$((counter + 1))
    fi
done
