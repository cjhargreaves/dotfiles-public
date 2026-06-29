local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

config.max_fps = 120
config.font = wezterm.font("JetBrainsMonoNL Nerd Font Mono", { weight = "DemiBold" })
config.font_size = 16.0
config.freetype_load_target = "Light"
config.freetype_load_flags = "NO_HINTING"
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_frame = { font = wezterm.font("JetBrainsMonoNL Nerd Font Mono", { weight = "Regular" }), font_size = 13.0 }
config.scrollback_lines = 10000
config.audible_bell = "Disabled"
config.send_composed_key_when_left_alt_is_pressed = false

config.colors = {
  background = "#000000",
  foreground = "#ffffff",
  cursor_bg = "#4e9a06",
  cursor_border = "#4e9a06",
  cursor_fg = "#000000",
  ansi = { "#000000", "#ff3333", "#33dd33", "#ffd000", "#3b78ff", "#d633ff", "#33dddd", "#ffffff" },
  brights = { "#808080", "#ff5555", "#55ff55", "#ffe855", "#5599ff", "#ff66ff", "#55ffff", "#ffffff" },
}
config.inactive_pane_hsb = { saturation = 0.5, brightness = 0.3 }

config.keys = {
  { key = "d", mods = "CMD", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
  { key = "d", mods = "CMD|SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
  { key = "w", mods = "CMD", action = act.CloseCurrentPane({ confirm = true }) },
  { key = "[", mods = "CMD", action = act.ActivatePaneDirection("Prev") },
  { key = "]", mods = "CMD", action = act.ActivatePaneDirection("Next") },
  { key = "LeftArrow", mods = "CMD|OPT", action = act.ActivatePaneDirection("Left") },
  { key = "RightArrow", mods = "CMD|OPT", action = act.ActivatePaneDirection("Right") },
  { key = "UpArrow", mods = "CMD|OPT", action = act.ActivatePaneDirection("Up") },
  { key = "DownArrow", mods = "CMD|OPT", action = act.ActivatePaneDirection("Down") },
  { key = "t", mods = "CMD", action = act.SpawnTab("CurrentPaneDomain") },
  { key = "LeftArrow", mods = "CMD", action = act.ActivateTabRelative(-1) },
  { key = "RightArrow", mods = "CMD", action = act.ActivateTabRelative(1) },
  { key = "1", mods = "CMD", action = act.ActivateTab(0) },
  { key = "2", mods = "CMD", action = act.ActivateTab(1) },
  { key = "3", mods = "CMD", action = act.ActivateTab(2) },
  { key = "4", mods = "CMD", action = act.ActivateTab(3) },
  { key = "5", mods = "CMD", action = act.ActivateTab(4) },
  { key = "6", mods = "CMD", action = act.ActivateTab(5) },
  { key = "7", mods = "CMD", action = act.ActivateTab(6) },
  { key = "8", mods = "CMD", action = act.ActivateTab(7) },
  { key = "9", mods = "CMD", action = act.ActivateTab(8) },
  { key = "k", mods = "CMD", action = act.ClearScrollback("ScrollbackAndViewport") },
  { key = "=", mods = "CMD", action = act.IncreaseFontSize },
  { key = "-", mods = "CMD", action = act.DecreaseFontSize },
  { key = "0", mods = "CMD", action = act.ResetFontSize },
}

return config
