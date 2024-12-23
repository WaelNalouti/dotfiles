-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = "kanagawabones" -- "carbonfox" "nordfox" "Tokyo Night Moon" "dayfox"

-- config.window_background_image = "./blur-bg.png"

-- Set background to same color as neovim
-- config.colors = {}
config.window_background_opacity = 0.9
-- default is true, has more "native" look
config.use_fancy_tab_bar = false
config.enable_tab_bar = false

-- No scrollbar
config.enable_scroll_bar = false
-- No title bar
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- config.tab_bar_at_bottom = true
-- config.freetype_load_target = "HorizontalLcd"

config.font = wezterm.font("Victor Mono", { weight = "DemiBold" })
config.font_size = 10

-- and finally, return the configuration to wezterm
return config
