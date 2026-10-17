#!/system/bin/sh
# 从 ksurc 中清理相关路径
sed -i '/com.termux/d' /data/adb/ksu/.ksurc 2>/dev/null
