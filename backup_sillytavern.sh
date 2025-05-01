#!/data/data/com.termux/files/usr/bin/bash

echo "📦 正在备份 SillyTavern 与配置..."
tar -czvf ~/sillytavern_backup.tar.gz ~/SillyTavern ~/.bashrc

echo "✅ 备份完成：~/sillytavern_backup.tar.gz"
echo "你可以将该文件导出或上传保存"
