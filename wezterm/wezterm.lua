local wezterm = require 'wezterm'

local act = wezterm.action

local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.default_prog = { 'cmd.exe', '/k' }
config.use_dead_keys = false
config.initial_cols = 100
config.initial_rows = 24
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.tab_max_width = 24
config.color_scheme = 'Catppuccin Mocha'
config.inactive_pane_hsb = {
 saturation = 0.7,
 brightness = 0.5
}
config.keys = {
  {
    key = 'c',
    mods = 'CTRL|SHIFT',
    action = wezterm.action_callback(function(window, pane)
        if pane:is_alt_screen_active() then
            window:perform_action(wezterm.action.SendKey{ key='c', mods='CTRL' }, pane)
        else
            window:perform_action(wezterm.action{ CopyTo = 'Clipboard' }, pane)
        end
    end),
  },
  { key = 'v', mods = 'CTRL|SHIFT', action = wezterm.action{ PasteFrom = 'Clipboard'} },
  { key = 'j', mods = 'CTRL|SHIFT', action = act.ScrollByLine(1) },
  { key = 'k', mods = 'CTRL|SHIFT', action = act.ScrollByLine(-1) },
  { key = 'd', mods = 'CTRL|SHIFT', action = act.ScrollByPage(0.5) },
  { key = 'u', mods = 'CTRL|SHIFT', action = act.ScrollByPage(-0.5) },
  { key = 'UpArrow', mods = 'CTRL|SHIFT', action = act.ScrollByLine(-1) },
  { key = 'DownArrow', mods = 'CTRL|SHIFT', action = act.ScrollByLine(1) },
  {
    key = 'r',
    mods = 'SHIFT|CTRL',
    action = act.ActivateKeyTable {
      name = 'resize_pane',
      one_shot = false,
    },
  },
  {
    key = 'a',
    mods = 'SHIFT|CTRL',
    action = act.ActivateKeyTable {
      name = 'activate_window',
    },
  },
  {
    key = "l",
    mods = "SHIFT|CTRL",
    action = wezterm.action { QuickSelectArgs={
      patterns = {
        "https?://(www\\.)?[-a-zA-Z0-9@:%._+~#=]{1,256}\\.[a-zA-Z0-9()]{1,6}\\b[-a-zA-Z0-9@:%_+.~#?&\\/=]*"
      },
      action = wezterm.action_callback(
        function(window, pane)
          local url = window:get_selection_text_for_pane(pane)
          wezterm.log_info("opening: " .. url)
          wezterm.open_with(url)
        end
      )
    }}
  },
}

config.key_tables = {
  resize_pane = {
    { key = 'LeftArrow', action = act.AdjustPaneSize { 'Left', 1 } },
    { key = 'h', action = act.AdjustPaneSize { 'Left', 1 } },

    { key = 'RightArrow', action = act.AdjustPaneSize { 'Right', 1 } },
    { key = 'l', action = act.AdjustPaneSize { 'Right', 1 } },

    { key = 'UpArrow', action = act.AdjustPaneSize { 'Up', 1 } },
    { key = 'k', action = act.AdjustPaneSize { 'Up', 1 } },

    { key = 'DownArrow', action = act.AdjustPaneSize { 'Down', 1 } },
    { key = 'j', action = act.AdjustPaneSize { 'Down', 1 } },

    { key = 'Escape', action = 'PopKeyTable' },
  },

  activate_window = {
    { key = 'LeftArrow', action = act.ActivatePaneDirection 'Left' },
    { key = 'h', action = act.ActivatePaneDirection 'Left' },

    { key = 'RightArrow', action = act.ActivatePaneDirection 'Right' },
    { key = 'l', action = act.ActivatePaneDirection 'Right' },

    { key = 'UpArrow', action = act.ActivatePaneDirection 'Up' },
    { key = 'k', action = act.ActivatePaneDirection 'Up' },

    { key = 'DownArrow', action = act.ActivatePaneDirection 'Down' },
    { key = 'j', action = act.ActivatePaneDirection 'Down' },

    { key = 'v', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }},
    { key = 's', action = act.SplitVertical { domain = 'CurrentPaneDomain' }},
    { key = 'n', action = act.SpawnTab 'CurrentPaneDomain' },

    { key = 'Escape', action = 'PopKeyTable' },
  },
}

-- Equivalent to POSIX basename(3)
-- Given "/foo/bar" returns "bar"
-- Given "c:\\foo\\bar" returns "bar"
local function basename(s)
  s = string.gsub(s, '(.*[/\\])(.*)', '%2')
  s = string.gsub(s, '%s+', '')
  return s
end

wezterm.on('format-tab-title', function(tab)
  local title = tab.tab_title
  local pane = tab.active_pane
  if not (title and #title > 0) then
    title = basename(pane.title)
  end
  title = title .. ' (' .. tab.tab_index + 1 .. ')'
  return {
    { Text = ' ' .. title .. ' ' },
  }
end)

wezterm.on('update-status', function(window, _)
  local name = window:active_key_table()
  if name then
    name = 'TABLE: ' .. name
  end
  window:set_right_status(name or '')
end)

return config

