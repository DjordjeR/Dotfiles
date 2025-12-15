-- Pull in the wezterm API
local wezterm = require("wezterm")

local is_windows = wezterm.target_triple:find("windows") ~= nil
-- This will hold the configuration.
local config = wezterm.config_builder()

-- Appearance
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 12
config.color_scheme = "nightfox"
config.hide_tab_bar_if_only_one_tab = true

-- OS specific startup shell
if is_windows then
	config.default_prog = { "pwsh.exe", "-NoLogo" }
	config.window_background_opacity = 1
else
	config.default_prog = { "/usr/bin/zsh", "-l" }
	config.window_background_opacity = 0.9
end

-- Launch options similar to Windows Terminal

config.launch_menu = {}

if is_windows then
	-- TODO:
else
	table.insert(config.launch_menu, {
		label = "Default",
		args = { "/usr/bin/zsh", "-l" },
	})
end

return config
