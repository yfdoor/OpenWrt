#/bin/bash
# This is free software, lisence use MIT.
# Copyright (C) https://github.com/yfdoor

# Modify default IP
sed -i 's/192.168.1.1/192.168.100.1/g' package/base-files/files/bin/config_generate

# Define My Package
git clone https://github.com/rufengsuixing/luci-app-adguardhome.git                 package/yfdoor/luci-app-adguardhome
