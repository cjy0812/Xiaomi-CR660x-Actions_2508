#删除旧feeds冲突主题
rm -rf ./feeds/luci/themes/luci-theme-argon
rm -rf ./feeds/luci/themes/luci-theme-design

# 创建默认开启无线脚本
cat > package/base-files/files/etc/uci-defaults/99-auto-enable-wifi << 'EOF'
#!/bin/sh
# 默认开启所有无线设备

. /lib/functions.sh
config_load wireless

wifi_enable_device() {
  local cfg="$1"
  uci set wireless.$cfg.disabled='0'
}

config_foreach wifi_enable_device wifi-device
uci commit wireless
EOF

# 设置可执行权限
chmod +x package/base-files/files/etc/uci-defaults/99-auto-enable-wifi
