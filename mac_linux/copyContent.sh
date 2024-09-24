#!/bin/sh

# 检查是否提供了文件路径参数
if [ -z "$1" ]; then
  echo "Usage: $0 <file_path> [number_of_lines]"
  exit 1
fi

FILE_PATH=$1
NUM_LINES=$2

# 检查文件是否存在
if [ ! -f "$FILE_PATH" ]; then
  echo "File not found: $FILE_PATH"
  exit 1
fi

# 如果提供了行数参数
if [ -n "$NUM_LINES" ]; then
  # 使用 head 命令获取指定的行数并拷贝到剪切板
  head -n "$NUM_LINES" "$FILE_PATH" | pbcopy
else
  # 将整个文件内容拷贝到剪切板
  cat "$FILE_PATH" | pbcopy
fi

echo "Content copied to clipboard."
