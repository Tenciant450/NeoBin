#!/system/bin/sh
if [ ! -d "/data/data/com.termux" ]; then
    ui_print "⚠️ 未检测到 Termux，模块可能无法正常工作！"
fi
set_perm_recursive $MODPATH 0 0 0755 0644
set_perm $MODPATH/system/bin/neobin 0 0 0755
set_perm $MODPATH/system/bin/apt 0 0 0755
set_perm $MODPATH/system/bin/pkg 0 0 0755