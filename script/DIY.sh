#/bin/bash
# This is free software, lisence use MIT.
# Copyright (C) https://github.com/yfdoor

# Modify default IP
sed -i 's/192.168.1.1/192.168.100.1/g' package/base-files/files/bin/config_generate

# Define My Package
mkdir -p package/yfdoor
git clone https://github.com/rufengsuixing/luci-app-adguardhome.git                 package/yfdoor
git clone https://github.com/KFERMercer/openwrt-adguardhome.git                     package/yfdoor
