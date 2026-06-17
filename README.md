# tmux.conf

个人 tmux 配置:GitHub Dark Dimmed 绿色主题,颜色集中在文件顶部的调色板统一管理。
前缀键改为 `Ctrl-g`,面向 macOS + Ghostty。

## 环境

- tmux ≥ 3.2(用到 `display-popup`、`pane-border-lines`、`pane-border-indicators`)
- macOS:复制走 `pbcopy`,`battery.sh` 用 `pmset` 读电量
- 真彩色终端(推荐 Ghostty;响铃通知会激活 `com.mitchellh.ghostty`)
- 可选:`terminal-notifier`(响铃时弹 macOS 桌面通知,缺了则静默跳过)

## 插件

克隆到 `~/.tmux/`:

```sh
git clone https://github.com/tmux-plugins/tmux-resurrect.git ~/.tmux/tmux-resurrect
git clone https://github.com/tmux-plugins/tmux-continuum.git ~/.tmux/tmux-continuum
git clone https://github.com/tmux-plugins/tmux-logging.git   ~/.tmux/tmux-logging
git clone https://github.com/fcsonline/tmux-thumbs.git       ~/.tmux/tmux-thumbs
# tmux-thumbs 是 Rust 写的,需要按其仓库说明编译
```

## 安装

```sh
git clone git@github.com:longgeek/tmux.conf.git ~/tmux.conf
ln -s ~/tmux.conf/.tmux.conf ~/.tmux.conf
ln -s ~/tmux.conf/battery.sh ~/.tmux/battery.sh
tmux source ~/.tmux.conf
```

## 快捷键(前缀 `Ctrl-g`)

| 键 | 作用 |
|---|---|
| `h` `j` `k` `l` | 切换 pane(左/下/上/右) |
| `H` `J` `K` `L` | 缩放 pane(可连按) |
| `c` / `%` / `"` | 新窗口 / 左右分屏 / 上下分屏(均保留当前目录) |
| `Tab` | 切回上一个窗口 |
| `T` | 给当前 pane 命名(显示在边框) |
| `r` | 重载配置 |
| `C` / `D` / `A` | 在 新窗口 / 右侧分屏 / 浮窗 里跑 `claude` |
| `Y` | 抓当前 pane 最近 200 行到剪贴板 |
| `S` | 广播输入到所有 pane |
| `G` / `!` | 浮窗开 lazygit / shell |
| `F` | 抓屏幕上的 path/hash/URL 到剪贴板(thumbs) |
| `/` | 进 copy-mode 反向搜索 |

复制模式用 vi 键位(`v` 选区、`y` 复制);鼠标拖选、双击选词、三击选行都直通系统剪贴板。

## 配色

所有颜色是文件顶部的 `@c_*` 变量,改一处全局生效;换主题只需改这些值。
