#!/bin/bash

set -e

input_dir="test/input"
expected_dir="test/expected"
tmp_dir="test/tmp"

mkdir -p "$tmp_dir"

# すべてのテストファイルに対して実行
for input_file in "$input_dir"/*.c; do
  file_name=$(basename "$input_file")
  expected_file="$expected_dir/$file_name"
  formatted_file="$tmp_dir/$file_name"

  # フォーマットして一時ファイルに保存
  clang-format "$input_file" > "$formatted_file"

  # 差分比較
  if ! diff -u "$expected_file" "$formatted_file"; then
    echo "❌ Format test failed: $file_name"
    exit 1
  else
    echo "✅ Format test passed: $file_name"
  fi
done

echo "🎉 All format tests passed."