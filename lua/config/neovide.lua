if not vim.g.neovide then
  -- 若果不是在 Neovide 中运行，则直接返回
  return
end

local general = require("config.general")

-- 显示 Neovide 版本
-- vim.print("Neovide version: " .. vim.g.neovide_version)

------------------------ 显示 -----------------------
-- 设置字体
if not general.is_macos() then
  vim.o.guifont = "Cascadia Code NF:h14"
end

-- 控制行间距
vim.opt.linespace = 0

-- 控制 UI 缩放比例
vim.g.neovide_scale_factor = 1.0

-- 文本渲染
vim.g.neovide_text_gamma = 0.0
vim.g.neovide_text_contrast = 0.5

-- 窗口透明度
vim.g.neovide_opacity = 0.95
vim.g.neovide_normal_opacity = 0.95

-- 窗口边距
vim.g.neovide_padding_top = 10
vim.g.neovide_padding_bottom = 0
vim.g.neovide_padding_right = 0
vim.g.neovide_padding_left = 0

-- 设置标题栏的颜色紧跟主题 ( 仅限 windows 有效 )
local normal_id = vim.api.nvim_get_hl_id_by_name("Normal")
local normal_hl = vim.api.nvim_get_hl(0, { id = normal_id })
local normal_bg = normal_hl.bg
vim.g.neovide_title_background_color = string.format("%x", normal_bg)

-- 设置标题栏字体为 cyan ( 仅限 windows 有效 )
vim.g.neovide_title_text_color = "cyan"

-- 设置窗口模糊
vim.g.neovide_window_blurred = false

-- 设置浮动窗口的阴影边框
vim.g.neovide_floating_shadow = true
vim.g.neovide_floating_z_height = 10
vim.g.neovide_light_angle_degrees = 45
vim.g.neovide_light_radius = 5

-- 设置浮动窗口的圆角半径 ( 0.0 ~ 1.0 )
vim.g.neovide_floating_corner_radius = 1.0

-- 设置在窗口周围绘制灰色边框 ( 仅限 macOS 有效 )
vim.g.neovide_show_border = true

-- 位置动画时间
vim.g.neovide_position_animation_length = 0.15

-- 滚动动画时间
vim.g.neovide_scroll_animation_length = 0.3

-- 滚动动画的远距离行数
vim.g.neovide_scroll_animation_far_lines = 1

-- 输入时隐藏鼠标
vim.g.neovide_hide_mouse_when_typing = false

-- 下划线自动缩放
vim.g.neovide_underline_stroke_scale = 1.0

-- 主题, 'light', 'dark', 'auto'
vim.g.neovide_theme = "dark"

-- 是否启用实验性的图层分组功能
vim.g.experimental_layer_grouping = false

------------------------ 功能 ------------------------
-- UI 刷新率
vim.g.neovide_refresh_rate = 60

-- 空闲时的刷新率
vim.g.neovide_refresh_rate_idle = 5

-- 当处于空闲状态时，是否降低刷新率以节省资源
vim.g.neovide_no_idle = true

-- 关闭时的确认提示
vim.g.neovide_confirm_quit = true

-- 关闭时的行为, 'always_quit', 'never_quit', 'ask'
vim.g.neovide_detach_on_quit = "always_quit"

-- 启动时是否记住上次的窗口大小
vim.g.neovide_remember_window_size = true

-- 启动时是否全屏
vim.g.neovide_fullscreen = false

-- macOS 下的特殊设置
if general.is_macos() then
  -- macOS 下使用简单的全屏模式
  vim.g.neovide_macos_simple_fullscreen = false
end

-- 是否开启性能分析器
vim.g.neovide_profiler = false

-- 防止光标在不应该移动至命令行时闪烁
vim.g.neovide_cursor_hack = false

-- 关闭输入法
vim.g.neovide_input_ime = false

------------------------ 光标 ------------------------
-- 光标移动动画的时长(单位: 秒)
vim.g.neovide_cursor_animation_length = 0.150

-- 光标短距离 ( 1-2字符 ) 移动的动画时长 ( 单位: 秒 )
vim.g.neovide_cursor_short_animation_length = 0.04

-- 光标尾迹长度 ( 0.0 ~ 1.0 )
vim.g.neovide_cursor_trail_size = 1.0

-- 抗锯齿
vim.g.neovide_cursor_antialiasing = true

-- 插入模式下的光标动画
vim.g.neovide_cursor_animate_in_insert_mode = true

-- 从编辑窗口切换到命令行时是否启用光标动画
vim.g.neovide_cursor_animate_command_line = true

-- 当窗口失焦时光标轮廓宽度
vim.g.neovide_cursor_unfocused_outline_width = 0.125

-- 是否启用平滑的光标闪烁动画
vim.g.neovide_cursor_smooth_blink = false

------------------------ 光标粒子 ------------------------
-- 光标特效模式, "", "railgun", "torpedo", "pixiedust", "ripple", "sonicboom", "wireframe"
vim.g.neovide_cursor_vfx_mode = { "railgun" }

-- 光标粒子透明度
vim.g.neovide_cursor_vfx_opacity = 200.0

-- 光标粒子存活时间
vim.g.neovide_cursor_vfx_particle_lifetime = 0.5 -- 适用于 "sonicboom", "ripple", "wireframe"
vim.g.neovide_cursor_vfx_particle_highlight_lifetime = 0.2

-- 光标粒子密度
vim.g.neovide_cursor_vfx_particle_density = 0.7

-- 光标粒子速度
vim.g.neovide_cursor_vfx_particle_speed = 10.0

-- 光标粒子方向随机性, 适用于 "railgun"
vim.g.neovide_cursor_vfx_particle_phase = 1.5

-- 光标粒子弯曲度, 适用于 "railgun"
vim.g.neovide_cursor_vfx_particle_curl = 1.0

------------------------ 快捷键 ------------------------
vim.keymap.set("n", "<F11>", function()
  vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
  if vim.g.neovide_fullscreen then
    general.neovide_opacity = vim.g.neovide_opacity
    general.neovide_normal_opacity = vim.g.neovide_normal_opacity
    vim.g.neovide_opacity = 1.0
    vim.g.neovide_normal_opacity = 1.0
  else
    vim.g.neovide_opacity = general.neovide_opacity
    vim.g.neovide_normal_opacity = general.neovide_normal_opacity
  end
end)
