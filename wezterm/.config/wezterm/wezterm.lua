-- WezTerm configuration
-- Appearance: rose-pine-moon, Hack Nerd Font, cross-platform (macOS/Windows).
-- Keybindings mirror iTerm2's default macOS shortcuts so muscle memory carries over.
-- Docs: https://wezfurlong.org/wezterm/config/files.html

local wezterm = require("wezterm")
local act = wezterm.action

local config = wezterm.config_builder()

local is_windows = os.getenv("OS") and os.getenv("OS"):lower():find("windows")
local is_macos = wezterm.target_triple:lower():find("darwin") ~= nil

-- ── Appearance ──────────────────────────────────────────────
config.color_scheme = "rose-pine-moon"
config.max_fps = 120
config.font = wezterm.font("Hack Nerd Font", { weight = "DemiBold" })
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_frame = {
  font = wezterm.font("Hack Nerd Font", { weight = "Bold" }),
}
config.inactive_pane_hsb = {
  saturation = 0.0,
  brightness = 0.5,
}
config.scrollback_lines = 10000
config.audible_bell = "Disabled"

if is_windows then
  config.win32_system_backdrop = "Acrylic"
  config.window_background_opacity = 0.7
  config.window_frame.font_size = 10.0
end

if is_macos then
  config.window_background_opacity = 0.8
  config.macos_window_background_blur = 50
  config.font_size = 15.0
  config.window_frame.font_size = 13.0
  -- Left Option sends Alt/Meta (useful for shell word-jumps)
  config.send_composed_key_when_left_alt_is_pressed = false
end

-- ── Keybindings (iTerm2 defaults) ───────────────────────────
config.keys = {
  -- Splits: ⌘D = vertical divider (side-by-side), ⌘⇧D = horizontal divider (stacked)
  { key = "d", mods = "CMD",       action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
  { key = "d", mods = "CMD|SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },

  -- Close pane: ⌘W
  { key = "w", mods = "CMD", action = act.CloseCurrentPane({ confirm = true }) },

  -- Navigate panes: ⌘⌥←/→/↑/↓
  { key = "LeftArrow",  mods = "CMD|OPT", action = act.ActivatePaneDirection("Left") },
  { key = "RightArrow", mods = "CMD|OPT", action = act.ActivatePaneDirection("Right") },
  { key = "UpArrow",    mods = "CMD|OPT", action = act.ActivatePaneDirection("Up") },
  { key = "DownArrow",  mods = "CMD|OPT", action = act.ActivatePaneDirection("Down") },

  -- Tabs: ⌘T new, ⌘←/⌘→ move between tabs
  { key = "t",          mods = "CMD", action = act.SpawnTab("CurrentPaneDomain") },
  { key = "LeftArrow",  mods = "CMD", action = act.ActivateTabRelative(-1) },
  { key = "RightArrow", mods = "CMD", action = act.ActivateTabRelative(1) },

  -- ⌘1..⌘9 jump to tab by index
  { key = "1", mods = "CMD", action = act.ActivateTab(0) },
  { key = "2", mods = "CMD", action = act.ActivateTab(1) },
  { key = "3", mods = "CMD", action = act.ActivateTab(2) },
  { key = "4", mods = "CMD", action = act.ActivateTab(3) },
  { key = "5", mods = "CMD", action = act.ActivateTab(4) },
  { key = "6", mods = "CMD", action = act.ActivateTab(5) },
  { key = "7", mods = "CMD", action = act.ActivateTab(6) },
  { key = "8", mods = "CMD", action = act.ActivateTab(7) },
  { key = "9", mods = "CMD", action = act.ActivateTab(8) },

  -- Clear scrollback: ⌘K
  { key = "k", mods = "CMD", action = act.ClearScrollback("ScrollbackAndViewport") },

  -- Font size: ⌘+ / ⌘- / ⌘0
  { key = "=", mods = "CMD", action = act.IncreaseFontSize },
  { key = "-", mods = "CMD", action = act.DecreaseFontSize },
  { key = "0", mods = "CMD", action = act.ResetFontSize },
}

return config
