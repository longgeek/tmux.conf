#!/bin/sh
# tmux status-right 电量段 — 只输出纯数字(不带 %),tmux 那边用 %% 补百分号。
# 单独成脚本的原因:绕开 tmux.conf 里 #() 内嵌引号冲突 + 输出里的 % 被 strftime 吞 两个坑。
# 绝对路径:#() 由 sh -c 执行,不依赖 tmux 进程的 PATH。
/usr/bin/pmset -g batt | /usr/bin/grep -Eo '[0-9]+%' | /usr/bin/head -1 | /usr/bin/tr -d '%'
