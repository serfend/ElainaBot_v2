#!/bin/bash
set -e

# 如果挂载的 config 目录为空，复制默认配置
if [ ! -f /app/config/settings.yaml ]; then
    echo ">>> 首次启动，复制默认配置..."
    mkdir -p /app/config
    cp /app/config.defaults/settings.yaml /app/config/settings.yaml
    cp /app/config.defaults/bot.yaml /app/config/bot.yaml 2>/dev/null || true
fi

# 如果挂载的 plugins 目录为空，复制系统插件
if [ ! -d /app/plugins/system ]; then
    echo ">>> 首次启动，复制默认插件..."
    mkdir -p /app/plugins
    cp -r /app/plugins.defaults/* /app/plugins/ 2>/dev/null || true
fi

# 如果挂载的 modules 目录为空，复制默认模块
if [ ! -d /app/modules ]; then
    echo ">>> 首次启动，复制默认模块..."
    mkdir -p /app/modules
    cp -r /app/modules.defaults/* /app/modules/ 2>/dev/null || true
fi

echo ">>> 启动 ElainaBot..."
exec python main.py "$@"
