#/bin/bash
# This is free software, lisence use MIT.
# Copyright (C) https://github.com/yfdoor

# Define IP
sed -i 's/192.168.1.1/192.168.100.1/g' package/base-files/files/bin/config_generate

# Define My Package
git clone https://github.com/rufengsuixing/luci-app-adguardhome.git                 package/yfdoor/luci-app-adguardhome

# Define Default
cat > package/lean/default-settings/files/zzz-default-settings <<-EOF
#!/bin/sh    
    # set time zone
    uci set system.@system[0].timezone=CST-8
    uci set system.@system[0].zonename=Asia/Shanghai
    uci commit system

    # set distfeeds
    cp /etc/opkg/distfeeds.conf /etc/opkg/distfeeds.conf_BK
    sed -i 's#http://downloads.openwrt.org#http://mirrors.tuna.tsinghua.edu.cn/openwrt#g' /etc/opkg/distfeeds.conf
    sed -i '/yfdoor/d' /etc/opkg/distfeeds.conf
    
    # set firewall
    sed -i '/REDIRECT --to-ports 53/d' /etc/firewall.user
    echo "iptables -t nat -A PREROUTING -p udp --dport 53 -j REDIRECT --to-ports 53" >> /etc/firewall.user
    echo "iptables -t nat -A PREROUTING -p tcp --dport 53 -j REDIRECT --to-ports 53" >> /etc/firewall.user

    # clear tmp
    rm -rf /tmp/luci*
    exit 0
EOF
