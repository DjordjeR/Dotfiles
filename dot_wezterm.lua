-- Pull in the wezterm API
local wezterm = require 'wezterm'

local is_windows = wezterm.target_triple:find("windows") ~= nil
-- This will hold the configuration.
local config = wezterm.config_builder()

-- Appearance
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 12
config.window_background_opacity = 1 
config.color_scheme = "nightfox"

-- OS specific startup shell
if is_windows then
    config.default_prog = { "pwsh.exe", "-NoLogo" }
else
    config.default_prog = { "/usr/bin/zsh", "-l" }
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
