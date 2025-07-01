local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.enable_tab_bar = false
config.initial_cols = 120
config.initial_rows = 28

config.font = wezterm.font 'JetBrains Mono'
config.font_size = 13

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.8
config.macos_window_background_blur = 15

config.color_scheme = 'tokyonight'

config.keys = {
  {
    key = 'LeftArrow',
    mods = 'OPT',
    action = wezterm.action.SendString('\x1bb'),
  },
  {
    key = 'RightArrow',
    mods = 'OPT',
    action = wezterm.action.SendString('\x1bf'),
  },
}

return config