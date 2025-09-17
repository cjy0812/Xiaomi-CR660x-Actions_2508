#!/bin/bash
set -eux

# 删除老版本
rm -rfv ./package/lean/luci-theme-argon
rm -rfv ./package/lean/luci-theme-design

Add-Turboacc
curl -sSL https://raw.githubusercontent.com/chenmozhijin/turboacc/luci/add_turboacc.sh -o add_turboacc.sh && bash add_turboacc.sh

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
git clone -b js https://github.com/0x676e67/luci-theme-design.git package/luci-theme-design

[ -d package/luci-theme-argon ] && rm -rfv package/luci-theme-argon
git clone https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
