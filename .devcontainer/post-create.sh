#!/usr/bin/env bash

# 如果存在 package.json 文件，则执行以下操作
if [ -f package.json ]; then
  # 安装 LTS 版本的 Node.js，并安装最新版本的 npm
  bash -i -c "nvm install --lts && nvm install-latest-npm"
  # 安装依赖
  npm i
  # 构建项目
  npm run build
fi

# 安装 shfmt 扩展的依赖
curl -sS https://webi.sh/shfmt | sh &>/dev/null

# 添加 OMZ 插件
# 克隆 zsh-syntax-highlighting 插件
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
# 克隆 zsh-autosuggestions 插件
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
# 更新 .zshrc 文件，添加插件到 zsh 插件列表
sed -i -E "s/^(plugins=\()(git)(\))/\1\2 zsh-syntax-highlighting zsh-autosuggestions\3/" ~/.zshrc

# 禁止 git log 使用 less
echo -e "\nunset LESS" >>~/.zshrc
