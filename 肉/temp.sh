#!/bin/bash

# 设置4K的分辨率阈值
width=3840
height=2160

# 设置 ImageMagick 的内存限制
export MAGICK_MEMORY_LIMIT=2GB
export MAGICK_MAP_LIMIT=2GB

# 遍历文件夹中的所有图片文件
for img in *.{jpg,jpeg,png,tiff,bmp,webp}; do
    if [ -f "$img" ]; then
        # 获取图片分辨率
        resolution=$(identify -format "%wx%h" "$img" 2>/dev/null)

        # 检查分辨率是否成功获取
        if [[ ! -z "$resolution" ]]; then
            img_width=$(echo $resolution | cut -d'x' -f1)
            img_height=$(echo $resolution | cut -d'x' -f2)

            # 判断分辨率是否小于4K
            if [ $img_width -lt $width ] || [ $img_height -lt $height ]; then
                echo "$img: $resolution"
            fi
        else
            echo "$img: Unable to read resolution"
        fi
    fi
done

