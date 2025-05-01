#!/data/data/com.termux/files/usr/bin/bash

echo "📦 正在恢复 SillyTavern 与配置..."
if [ -f ~/sillytavern_backup.tar.gz ]; then
  tar -xzvf ~/sillytavern_backup.tar.gz -C ~
  echo "✅ 恢复完成，请重启 Termux 以应用启动菜单"
else
  echo "❌ 未找到备份文件 ~/sillytavern_backup.tar.gz"
fi
