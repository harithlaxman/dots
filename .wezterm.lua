local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = 'Everforest Dark (Gogh)'
config.font = wezterm.font("JetBrains Mono")
config.font_size = 15.0
config.window_background_opacity = 0.8
config.macos_window_background_blur = 70

config.enable_tab_bar = false

return config
