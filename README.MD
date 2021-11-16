# OpenWrt

## 简介：
- 自用 OpenWrt 定制项目
- 默认后台登录地址：192.168.100.1
- 若 Fork 项目，请修改代码中自己的 TOKEN

## 功能：
- 支持编译官方源码或第三方源码
- Package：默认添加 [yfdoor/OpenWrt-Packages](https://github.com/yfdoor/OpenWrt-Packages)，该库包含所有 Lean's package and Lienol's package 和一些自用 package，且定期自动更新。
- 自动发布固件
- 自动创建分支

## 变量：
| 变量名 | 释义 |
| :--- | :--- |
| -- REPO_URL: https://github.com/openwrt/openwrt.git  | 定义源码 |
| -- REPO_BRANCH: v19.07.2 | 定义分支 |
| -- DIY_FILE: script/DIY.sh | 定义脚本 |
| -- CONF_FILE: x86_64 | 定义配置文件 |
| -- SSH_ACTION: false |是否打开 SSH |
| -- UPLOAD_BRANCH: true | 是否创建分支 |
| -- UPLOAD_RELEASE: true | 是否创建发行版|
| -- UPLOAD_BIN_DIR: true | 是否创建 Bin 到 Artifact |
| -- UPLOAD_FIRMWARE: true | 是否创建 Firmware 到 Artifact |
| -- UPLOAD_WETRANSFER: true | 是否创建外链 WETRANSFER|
| -- UPLOAD_COWTRANSFER: true | 是否创建外链 COWTRANSFER |

## 目录：
- ### config.d：
  - 目录存放编译需要的 **config** 配置文件
  - 默认使用 **x86_64** 配置文件

- ### script:
  - 目录存放需要执行的定制脚本
  - 默认使用 **DIY** 配置文件

- ### files:
  - 目录存放定制文件
  - 举例：假如说您需要一个使用预配置文件 /etc/config/firewall 来构建固件，那么把您的 **firewall** 配置文件文件放到下面的路径：/files/etc/config
  
## 尾巴：
  - /include/target.mk：可定义默认安装的 packages
  - /target/linux/x86/Makefile：可定义对应平台默认安装的 packages（X86示例）
  
## 发布:
  - [最新发布](https://github.com/yfdoor/OpenWrt/releases/latest)
  
## 感谢：
  - [OpenWrt](https://github.com/openwrt/openwrt)
  - [Lean LEDE](https://github.com/coolsnowwolf/lede)