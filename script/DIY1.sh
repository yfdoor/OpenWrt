#/bin/bash
# This is free software, lisence use MIT.
# Copyright (C) https://github.com/yfdoor

# Define IP
sed -i 's/192.168.1.1/192.168.100.1/g' package/base-files/files/bin/config_generate
sed -i 's/10.10.10.1/192.168.100.1/g' package/base-files/files/bin/config_generate

# Define Default
cat > package/yfdoorg/yfdoor/default-settings/files/zzz-default-settings <<-EOF
#!/bin/sh    
    # change password
    sed -i '/root/d' /etc/shadow
    sed -i '1 i root:::0:99999:7:::' /etc/shadow

    # set language
    uci set luci.main.lang=zh_cn
    uci commit luci

    # set fstab
    uci set fstab.@global[0].anon_mount=1
    uci commit fstab

    # set time zone
    uci set system.@system[0].timezone=CST-8
    uci set system.@system[0].zonename=Asia/Shanghai
    uci commit system
    
    # set distfeeds
    cp /etc/opkg/distfeeds.conf /etc/opkg/distfeeds.conf_BK
    sed -i 's#downloads.openwrt.org#mirrors.cloud.tencent.com/openwrt#g' /etc/opkg/distfeeds.conf
    sed -i '/yfdoor/d' /etc/opkg/distfeeds.conf
    
    # set firewall
    sed -i '/REDIRECT --to-ports 53/d' /etc/firewall.user
    echo 'iptables -t nat -A PREROUTING -p udp --dport 53 -j REDIRECT --to-ports 53' >> /etc/firewall.user
    echo 'iptables -t nat -A PREROUTING -p tcp --dport 53 -j REDIRECT --to-ports 53' >> /etc/firewall.user
    echo '[ -n "$(command -v ip6tables)" ] && ip6tables -t nat -A PREROUTING -p udp --dport 53 -j REDIRECT --to-ports 53' >> /etc/firewall.user
    echo '[ -n "$(command -v ip6tables)" ] && ip6tables -t nat -A PREROUTING -p tcp --dport 53 -j REDIRECT --to-ports 53' >> /etc/firewall.user

    echo 'MODEMIP=192.168.1.1' >> /etc/firewall.user
    echo 'MODEM_NET=`echo $MODEMIP | cut -d "." -f 1-3`' >> /etc/firewall.user
    echo 'ROUTER_WAN_PORT_IP=192.168.1.2' >> /etc/firewall.user
    echo 'WAN_PORT=eth0'>> /etc/firewall.user
    echo 'ifconfig $WAN_PORT $ROUTER_WAN_PORT_IP netmask 255.255.255.0 broadcast $MODEM_NET.255' >> /etc/firewall.user
    echo 'iptables -A forwarding_rule -d $MODEMIP -j ACCEPT' >> /etc/firewall.user
    echo 'iptables -t nat -A postrouting_rule -d $MODEMIP -o $WAN_PORT -j MASQUERADE' >> /etc/firewall.user
    
    # Others
    ln -sf /sbin/ip /usr/bin/ip
    sed -i '/option disabled/d' /etc/config/wireless
    sed -i '/set wireless.radio${devidx}.disabled/d' /lib/wifi/mac80211.sh

    sed -i '/log-facility/d' /etc/dnsmasq.conf
    echo "log-facility=/dev/null" >> /etc/dnsmasq.conf    

    echo 'hsts=0' > /root/.wgetrc
    
    rm -rf /tmp/luci-modulecache/
    rm -f /tmp/luci-indexcache
    exit 0
EOF
