# frozen_string_literal: true

# 定义 gem 源
source "https://rubygems.org"

# 引入 jekyll-theme-chirpy 主题，版本为 7.2 或以上，至少为 7.2.4
gem "jekyll-theme-chirpy", "~> 7.2", ">= 7.2.4"

# 引入 html-proofer，用于测试组，版本为 5.0 以上
gem "html-proofer", "~> 5.0", group: :test

# 针对特定平台的 gem 配置
platforms :mingw, :x64_mingw, :mswin, :jruby do
  # 引入 tzinfo gem，版本要求为 1 或更高，低于 3
  gem "tzinfo", ">= 1", "< 3"
  # 引入 tzinfo-data 用于时区数据
  gem "tzinfo-data"
end

# 为特定 Windows 平台配置 wdm gem，版本为 0.2.0 或以上
gem "wdm", "~> 0.2.0", :platforms => [:mingw, :x64_mingw, :mswin]
