cmake_minimum_required(VERSION 3.5)
project(MyCProject C)

set(CMAKE_C_STANDARD 11)

# すべての .c ファイルを再帰的に収集
file(GLOB_RECURSE SOURCES "test/input/*.c")

# 実行ファイル（またはライブラリ）を指定
add_executable(my_program ${SOURCES})

# インクルードパスを指定（必要に応じて）
include_directories(include)

# compile_commands.json を出力するオプション
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
