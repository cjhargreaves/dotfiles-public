-- WezTerm configuration
-- Keybindings mirror iTerm2's default macOS shortcuts so muscle memory carries over.
-- Docs: https://wezfurlong.org/wezterm/config/files.html

local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

-- ── Appearance ──────────────────────────────────────────────
config.color_scheme = "Tokyo Night"
config.font = wezterm.font_with_fallback({ "Menlo", "JetBrains Mono" })
config.font_size = 13.0
config.window_decorations = "RESIZE"
config.window_background_opacity = 1.0
config.scrollback_lines = 10000
config.audible_bell = "Disabled"

-- macOS: make the left Option key send Alt/Meta (useful for word-jumps in shells)
config.send_composed_key_when_left_alt_is_pressed = false

-- ── Keybindings (iTerm2 defaults) ───────────────────────────
config.keys = {
  -- Splits: ⌘D = vertical (side-by-side), ⌘⇧D = horizontal (stacked)
  { key = "d", mods = "CMD",       action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
  { key = "d", mods = "CMD|SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },

  -- Close pane: ⌘W
  { key = "w", mods = "CMD", action = act.CloseCurrentPane({ confirm = true }) },

  -- Navigate panes: ⌘⌥←/→/↑/↓  (matches iTerm's split-pane navigation)
  { key = "LeftArrow",  mods = "CMD|OPT", action = act.ActivatePaneDirection("Left") },
  { key = "RightArrow", mods = "CMD|OPT", action = act.ActivatePaneDirection("Right") },
  { key = "UpArrow",    mods = "CMD|OPT", action = act.ActivatePaneDirection("Up") },
  { key = "DownArrow",  mods = "CMD|OPT", action = act.ActivatePaneDirection("Down") },

  -- Tabs: ⌘T new, ⌘← / ⌘→ move between tabs
  { key = "t",          mods = "CMD", action = act.SpawnTab("CurrentPaneDomain") },
  { key = "LeftArrow",  mods = "CMD", action = act.ActivateTabRelative(-1) },
  { key = "RightArrow", mods = "CMD", action = act.ActivateTabRelative(1) },

  -- ⌘1..⌘9 jump to tab by index (iTerm behavior)
  { key = "1", mods = "CMD", action = act.ActivateTab(0) },
  { key = "2", mods = "CMD", action = act.ActivateTab(1) },
  { key = "3", mods = "CMD", action = act.ActivateTab(2) },
  { key = "4", mods = "CMD", action = act.ActivateTab(3) },
  { key = "5", mods = "CMD", action = act.ActivateTab(4) },
  { key = "6", mods = "CMD", action = act.ActivateTab(5) },
  { key = "7", mods = "CMD", action = act.ActivateTab(6) },
  { key = "8", mods = "CMD", action = act.ActivateTab(7) },
  { key = "9", mods = "CMD", action = act.ActivateTab(8) },

  -- Clear scrollback: ⌘K (like iTerm)
  { key = "k", mods = "CMD", action = act.ClearScrollback("ScrollbackAndViewport") },

  -- Font size: ⌘+ / ⌘- / ⌘0
  { key = "=", mods = "CMD", action = act.IncreaseFontSize },
  { key = "-", mods = "CMD", action = act.DecreaseFontSize },
  { key = "0", mods = "CMD", action = act.ResetFontSize },
}

return config
