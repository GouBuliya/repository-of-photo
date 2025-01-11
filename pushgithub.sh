#!/bin/bash

# 检查是否在 Git 仓库中
if [ ! -d ".git" ]; then
  echo "当前目录不是一个 Git 仓库，正在初始化..."
  git init
fi

# 添加所有文件到暂存区
echo "正在添加所有文件到暂存区..."
git add .

# 检查是否有更改需要提交
if [ -z "$(git status --porcelain)" ]; then
  echo "没有更改需要提交，仓库已是最新状态。"
  exit 0
fi

# 提交更改
echo "正在提交更改..."
read -p "请输入提交信息: " commit_message
git commit -m "$commit_message"

# 检查是否配置了远程仓库
remote_url=$(git config --get remote.origin.url)
if [ -z "$remote_url" ]; then
  echo "未配置远程仓库，请输入远程仓库 URL："
  read -p "远程仓库 URL: " remote_url
  git remote add origin $remote_url
fi

# 推送更改到远程仓库
echo "正在推送更改到远程仓库..."
git push origin main

# 检查推送结果
if [ $? -eq 0 ]; then
  echo "推送成功！"
else
  echo "推送失败，请检查错误信息并重试。"
fi
