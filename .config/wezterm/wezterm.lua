local wezterm = require("wezterm")

local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

wezterm.on("user-var-changed", function(window, pane, name, value)
	local overrides = window:get_config_overrides() or {}
	if name == "ZEN_MODE" then
		local incremental = value:find("+")
		local number_value = tonumber(value)
		if incremental ~= nil then
			while number_value > 0 do
				window:perform_action(wezterm.action.IncreaseFontSize, pane)
				number_value = number_value - 1
			end
			overrides.enable_tab_bar = false
		elseif number_value < 0 then
			window:perform_action(wezterm.action.ResetFontSize, pane)
			overrides.font_size = nil
			overrides.enable_tab_bar = true
		else
			overrides.font_size = number_value
			overrides.enable_tab_bar = false
		end
	end
	window:set_config_overrides(overrides)
end)

config.font = wezterm.font("ZedMono Nerd Font")

config.font_size = 15
config.line_height = 1.2
config.warn_about_missing_glyphs = false

local theme = require("themes.rose-pine").main
config.colors = theme.colors()
config.max_fps = 120

config.macos_window_background_blur = 20

config.enable_tab_bar = false
config.enable_wayland = false

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.85

config.window_padding = {
	left = 4,
	right = 0,
	top = 8,
	bottom = 2,
}

return config
