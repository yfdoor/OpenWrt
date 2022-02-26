#/bin/bash
# This is free software, lisence use MIT.
# Copyright (C) https://github.com/yfdoor

# Define My Package
git clone https://github.com/yfdoor/OpenWrt-Packages.git          package/yfdoorg

# Fix Lean's package
if [ $REPO_URL != "https://github.com/coolsnowwolf/lede.git" ]; then   
    mkdir -p tools/ucl && wget -P tools/ucl https://raw.githubusercontent.com/coolsnowwolf/lede/master/tools/ucl/Makefile          
    mkdir -p tools/upx && wget -P tools/upx https://raw.githubusercontent.com/coolsnowwolf/lede/master/tools/upx/Makefile
    sed -i '23a\tools-y += ucl upx' tools/Makefile
    sed -i '/builddir dependencies/a\$(curdir)/upx/compile := $(curdir)/ucl/compile' tools/Makefile
fi
