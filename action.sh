#!/system/bin/sh
MODDIR=${0%/*}
CONF_FILE="$MODDIR/uid.conf"
KSURC="/data/adb/ksu/.ksurc"

echo "================================"
echo "     NeoBin 自动配置程序"
echo "================================"

echo "[1/3] 正在探测 Termux 环境..."
TERMUX_UID=$(stat -c %u /data/data/com.termux 2>/dev/null)

if [ -n "$TERMUX_UID" ]; then
    echo "  -> 探测成功！Termux UID: $TERMUX_UID"
    echo "$TERMUX_UID" > "$CONF_FILE"
    chmod 644 "$CONF_FILE"
    echo "  -> 已保存配置至 uid.conf"
else
    echo "  -> 警告: 未检测到 Termux 目录！"
    echo "  -> 请确保已安装 Termux 后再试。"
fi

echo "[2/3] 正在修复脚本执行权限..."
chmod 755 "$MODDIR/system/bin/"*
echo "  -> bin 目录权限已修复"

echo "[3/3] 正在注入环境变量..."
[ ! -f "$KSURC" ] && touch "$KSURC"

if ! grep -q "neobin/system/bin" "$KSURC"; then
    echo "export PATH=$MODDIR/system/bin:\$PATH" >> "$KSURC"
    echo "  -> 已成功将路径写入 .ksurc"
else
    echo "  -> .ksurc 中已存在路径，跳过注入"
fi

echo "================================"
echo " 初始化完成！"
echo " 请退出当前终端，重新输入 su 即可使用。"
echo " 3s后自动退出..."
echo "================================"
sleep 3
exit 0