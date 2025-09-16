#!/bin/bash
set -eux

# 删除老版本
rm -rfv ./package/lean/luci-theme-argon
rm -rfv ./package/lean/luci-theme-design

# 添加 Apps
for pkg in luci-app-wizard netspeedtest lucky adguardhome; do
    [ -d package/$pkg ] && rm -rfv package/$pkg
done

git clone https://github.com/sirpdboy/luci-app-wizard.git package/luci-app-wizard
git clone https://github.com/sirpdboy/luci-app-netspeedtest.git package/netspeedtest
git clone https://github.com/sirpdboy/luci-app-lucky.git package/lucky
git clone https://github.com/sirpdboy/luci-app-adguardhome.git package/adguardhome

# 添加主题
[ -d package/luci-theme-design ] && rm -rfv package/luci-theme-design
git clone https://github.com/gngpp/luci-theme-design.git package/luci-theme-design

[ -d package/luci-theme-argon ] && rm -rfv package/luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
