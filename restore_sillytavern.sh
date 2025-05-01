#!/data/data/com.termux/files/usr/bin/bash

echo "📦 正在恢复 SillyTavern 与配置..."
if [ -f ~/sillytavern_backup.tar.gz ]; then
  # 创建临时恢复目录
  mkdir -p ~/sillytavern_restore_tmp

  # 解压备份文件到临时目录
  tar -xzvf ~/sillytavern_backup.tar.gz -C ~/sillytavern_restore_tmp

  # 恢复 SillyTavern 文件夹
  rm -rf ~/SillyTavern
  mv ~/sillytavern_restore_tmp/SillyTavern ~/SillyTavern

  # 恢复 .bashrc
  cp -f ~/sillytavern_restore_tmp/.bashrc ~/.bashrc

  # 清理临时目录
  rm -rf ~/sillytavern_restore_tmp

  echo "✅ 恢复完成，请重启 Termux 以应用启动菜单"
else
  echo "❌ 未找到备份文件 ~/sillytavern_backup.tar.gz"
fi
