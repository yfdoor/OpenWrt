# OpenWrt

## 简介：
- 自用 OpenWrt 定制。

## 功能：
- ### config.d：
  - 目录存放 **.config** 配置文件。
  - 默认使用 **x86_64.config** 配置文件。
- ### feeds.conf.default：
  - 用来替换 feeds 源。
- ### 自定义：
  - /include/target.mk：可定义默认安装的 packages。
  - /target/linux/x86/Makefile：可定义对应平台默认安装的 packages（X86示例）。
- ### 自动发布:
  - [最新发布](https://github.com/yfdoor/OpenWrt/releases/latest)
