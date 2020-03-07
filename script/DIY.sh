#/bin/bash
# This is free software, lisence use MIT.
# Copyright (C) https://github.com/yfdoor

# Modify default IP
sed -i 's/192.168.1.1/192.168.100.1/g' package/base-files/files/bin/config_generate

#uci set luci.main.lang=zh_cn
#uci commit luci
#uci set system.@system[0].timezone=CST-8
#uci set system.@system[0].zonename=Asia/Shanghai
#uci commit system

#sed -i 's/downloads.openwrt.org/op.hyird.xyz/g' /etc/opkg/distfeeds.conf
#sed -i 's/snapshots/$(cat ../version)/g' /etc/opkg/distfeeds.conf
#sed -i "s/# //g" /etc/opkg/distfeeds.conf
