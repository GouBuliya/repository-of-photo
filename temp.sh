#!/bin/bash

# 定义文件夹路径
downloads_folder="$HOME/Downloads"
pictures_folder="$HOME/Pictures/肉"
counter=17

# 无限循环，间隔1秒扫描一次
while true; do
    # 查找符合条件的图片文件
    for img in "$downloads_folder"/image*.png; do
        # 检查文件是否存在（防止没有符合条件的文件时报错）
        if [[ -f "$img" ]]; then
            # 构建新的文件名
            new_name="$pictures_folder/肉$counter.png"
            # 重命名并移动文件
            mv "$img" "$new_name"
            echo "Renamed and moved: $img -> $new_name"
            # 增加计数器
            counter=$((counter + 1))
        fi
    done
    # 每1秒扫描一次
    sleep 1
done

