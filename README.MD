# OpenWrt

## 简介：
- 自用 OpenWrt

## 功能：
- 可以支持三种编译模式： 
  1. 编译官方源码
  2. 编译Lean源码
  3. 编译官方源码 & Lean Package
- 变量：
  - REPO_URL: https://github.com/openwrt/openwrt.git
  - REPO_URL: https://github.com/coolsnowwolf/lede.git
  - REPO_BRANCH: v19.07.2
  - DIY_FILE: script/DIY.sh
  - CON_FILE: x86_64
  - PKG_EXTRAS: true
  - SSH_ACTION: false
  - UPLOAD_BRANCH: true
  - UPLOAD_RELEASE: true
  - UPLOAD_FIRMWARE: true

## 目录：
- ### config.d：
  - 目录存放编译需要的 **config** 配置文件
  - 默认使用 **x86_64** 配置文件
- ### script:
  - 目录存放需要执行的脚本
  - 默认文件 DIY
- ### 自定义：
  - /include/target.mk：可定义默认安装的 packages。
  - /target/linux/x86/Makefile：可定义对应平台默认安装的 packages（X86示例）。
- ### 自动发布:
  - [最新发布](https://github.com/yfdoor/OpenWrt/releases/latest)
