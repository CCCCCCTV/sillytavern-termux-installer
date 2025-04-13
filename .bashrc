echo ""
echo "============================="
echo "🛠️ SillyTavern Termux 管理助手"
echo "============================="

echo ""
echo "请选择操作："
echo "1. 检查并更新 SillyTavern（并自动启动）"
echo "2. 启动 SillyTavern"
echo "3. 退出"
echo -n "输入选项编号 (1/2/3): "
read choice

case "$choice" in
  1)
    cd ~/SillyTavern
    echo "🔄 正在检查更新..."
    git pull
    echo "🧹 清理 package-lock.json（避免警告）..."
    rm -f package-lock.json
    echo "📦 正在更新依赖（如有必要）..."
    yarn install
    echo "✅ 更新完成，正在启动 SillyTavern..."
    yarn start
    ;;
  2)
    cd ~/SillyTavern
    echo "✨ 正在启动 SillyTavern..."
    yarn start
    ;;
  *)
    echo "👋 已退出，欢迎下次使用 SillyTavern 管理助手！"
    ;;
esac
