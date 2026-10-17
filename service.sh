#!/system/bin/sh
MODDIR=${0%/*}
# 只有永久 Root 用户开机时才会自动执行这个脚本
# 临时 Root 用户请手动 source termux-env
if [ -x "$MODDIR/system/bin/termux-env" ]; then
    . "$MODDIR/system/bin/termux-env" 2>/dev/null
fi
