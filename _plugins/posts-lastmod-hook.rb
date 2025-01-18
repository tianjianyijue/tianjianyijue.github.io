#!/usr/bin/env ruby
#
# 检查更改过的文章

# 使用 Jekyll 钩子注册，在文章初始化时触发此操作
Jekyll::Hooks.register :posts, :post_init do |post|

  # 使用 Git 命令获取当前文章的提交历史记录数量
  # `git rev-list --count HEAD "#{ post.path }"` 会返回文章文件的提交次数
  commit_num = `git rev-list --count HEAD "#{ post.path }"`

  # 如果该文章的提交次数大于 1，表示文章有过修改历史
  if commit_num.to_i > 1
    # 使用 Git 命令获取该文章最近一次提交的日期（格式为 ISO 8601）
    lastmod_date = `git log -1 --pretty="%ad" --date=iso "#{ post.path }"`
    
    # 将最后修改日期存储到文章的元数据（front matter）中，字段名为 'last_modified_at'
    post.data['last_modified_at'] = lastmod_date
  end

end
