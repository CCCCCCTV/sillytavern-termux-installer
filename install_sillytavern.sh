#!/data/data/com.termux/files/usr/bin/bash

echo ""
echo "============================="
echo "📦 SillyTavern 安装启动器"
echo "============================="
sleep 1

# 更新 & 安装依赖
yes | pkg update
yes | pkg upgrade
yes | pkg install git
yes | pkg install nodejs
yes | pkg install curl

# 启用 corepack 并激活 yarn
corepack enable
corepack prepare yarn@stable --activate

# 克隆 SillyTavern 仓库
cd ~
if [ -d "SillyTavern" ]; then
  echo "📁 SillyTavern 已存在，跳过克隆"
else
  git clone https://github.com/SillyTavern/SillyTavern.git
fi

cd ~/SillyTavern

# 清理 package-lock.json，避免 yarn 警告
rm -f package-lock.json

# 安装依赖
echo "📦 正在安装 SillyTavern 依赖..."
yarn install

# 配置 .bashrc 自动提示更新和启动
echo "🛠️ 正在配置 Termux 启动助手..."

cat > ~/.bashrc << 'EOF'

echo ""
echo "============================="
echo "🛠️ SillyTavern Termux 管理助手"
echo "============================="

# 是否检查更新
echo ""
echo "👉 是否检查 SillyTavern 更新？(y/n)"
read update_choice
if [ "$update_choice" = "y" ]; then
  cd ~/SillyTavern
  echo "🔄 正在检查更新..."
  git pull
  echo "🧹 清理 package-lock.json（避免警告）..."
  rm -f package-lock.json
  echo "📦 正在更新依赖（如有必要）..."
  yarn install
  echo "✅ 更新完成"
fi

# 是否启动
echo ""
echo "🚀 是否启动 SillyTavern？(y/n)"
read start_choice
if [ "$start_choice" = "y" ]; then
  cd ~/SillyTavern
  echo "✨ 正在启动 SillyTavern..."
  yarn start
fi

EOF

echo ""
echo "✅ SillyTavern 部署完成！关闭 Termux 并重新打开，即可体验启动助手！"
