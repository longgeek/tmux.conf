#!/bin/sh
# Claude 上下文用量读端：供 tmux status-right 的 #() 每 5 秒调用。
# 本脚本仿 ~/.tmux/battery.sh 模式：只读 ~/.claude/statusline.sh（写端）落下的缓存，自己不产生数据。
# 输出里不得含 % 字符（tmux 会把它当格式转义），百分比数字由 tmux 侧用 %% 补上。

CACHE=/Users/lirong/.claude/statusline-context.txt

# 缓存不存在：无输出直接退出
[ -f "$CACHE" ] || exit 0
# 缓存超过 120 秒没更新：会话可能已死，数据过期，无输出退出
now=$(date +%s)
mtime=$(stat -f %m "$CACHE" 2>/dev/null) || exit 0
[ $(( now - mtime )) -le 120 ] || exit 0
# 新鲜缓存：竖线分隔符 + 原样输出缓存内容（写端保证无换行结尾、无 % 字符）
printf '\033[90m│\033[0m '
cat "$CACHE"
