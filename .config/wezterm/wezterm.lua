local wezterm = require 'wezterm'

local config = wezterm.config_builder()
local platform = wezterm.target_triple

-- Actual config
config.font = wezterm.font 'JetBrains Mono'
config.font_size = 15

config.color_scheme = 'Everforest Dark (Gogh)'

if platform:find('apple') then
	config.initial_cols = 120
	config.initial_rows = 35
	config.window_background_opacity = 0.90
	config.macos_window_background_blur = 90
end

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

config.colors = {
  tab_bar = require 'tabbar'
}

return config
