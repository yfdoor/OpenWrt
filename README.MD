# OpenWrt

## 简介：
- 自用 OpenWrt

## 功能：
- 可以支持三种编译模式 
  1. 编译官方源码
  2. 编译Lean源码
  3. 编译官方源码 & Lean Package
- 自动上传固件
- 自动发布固件
- 自动创建分支
- 自动同步码云

## 变量：

| 变量名 | 释义 |
| :--- | :--- |
| -- REPO_URL: https://github.com/openwrt/openwrt.git  | 定义源码 |
| -- REPO_BRANCH: v19.07.2 | 定义分支 |
| -- DIY_FILE: script/DIY.sh | 定义脚本文件 |
| -- CON_FILE: x86_64 | 定义配置文件 |
| -- PKG_EXTRAS: true | 是否包含Lean's package |
| -- SSH_ACTION: false |是否打开 SSH |
| -- UPLOAD_BRANCH: true | 是否创建分支来存放编译固件及package |
| -- UPLOAD_RELEASE: true | 是否创建发行版本 Release |
| -- UPLOAD_FIRMWARE: true | 是否创建固件到 Artifact |

## 目录：
- ### config.d：
  - 目录存放编译需要的 **config** 配置文件
  - 默认使用 **x86_64** 配置文件
- ### script:
  - 目录存放需要执行的脚本
  - 默认文件 DIY
  
## 自定义：
  - /include/target.mk：可定义默认安装的 packages。
  - /target/linux/x86/Makefile：可定义对应平台默认安装的 packages（X86示例）
  
## 自动发布:
  - [最新发布](https://github.com/yfdoor/OpenWrt/releases/latest)
