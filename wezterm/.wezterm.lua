local wezterm = require("wezterm")
local config = wezterm.config_builder()
local brightness = 0.03
local act = wezterm.action
-- window setting
config.window_background_opacity = 0.90
config.macos_window_background_blur = 85
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}

config.color_scheme = "Tokyo Night"
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Medium", stretch = "Expanded" })
config.font_size = 18
config.default_domain = 'WSL:Ubuntu-24.04'

config.window_decorations = "RESIZE"
config.enable_tab_bar = false
config.front_end = "OpenGL"

config.window_frame = {
    border_left_width = "0.28cell",
    border_right_width = "0.28cell",
    border_bottom_height = "0.15cell",
    border_top_height = "0.15cell"
}

config.keys = {
    {
        key = "v",
        mods = "CTRL|SHIFT",
        action = act.PasteFrom("Clipboard"),
    },
}

-- others
config.default_cursor_style = "BlinkingUnderline"
config.cursor_thickness = 2
return config
