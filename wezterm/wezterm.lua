local wezterm = require 'wezterm'

local act = wezterm.action

local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.default_prog = { 'cmd.exe', '/k', '%CMDER_ROOT%\\vendor\\init.bat' }
-- config.default_prog = { 'C:\\Users\\Tangtang\\scoop\\apps\\git\\current\\usr\\bin\\bash.exe', '--login' }
config.initial_cols = 100
config.initial_rows = 24
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.color_scheme = 'Catppuccin Mocha'
config.inactive_pane_hsb = {
 saturation = 0.7,
 brightness = 0.5
}
config.keys = {
  {
    key = 'c',
    mods = 'CTRL',
    action = wezterm.action_callback(function(window, pane)
        if pane:is_alt_screen_active() then
            window:perform_action(wezterm.action.SendKey{ key='c', mods='CTRL' }, pane)
        else
            window:perform_action(wezterm.action{ CopyTo = 'Clipboard' }, pane)
        end
    end),
  },
  { key = 'v', mods = 'CTRL', action = wezterm.action{ PasteFrom = 'Clipboard'} },
  { key = 'UpArrow', mods = 'SHIFT', action = act.ScrollByLine(-1) },
  { key = 'DownArrow', mods = 'SHIFT', action = act.ScrollByLine(1) },
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

local function shorten_cmd_title(title)
  if title:find("cmd.exe") then
    return "cmd.exe"
  end
  return title
end

wezterm.on('format-tab-title', function(tab_info)
  local title = tab_info.tab_title
  if not (title and #title > 0) then
    title = tab_info.active_pane.title
  end
  return ' ' .. shorten_cmd_title(title) .. ' '
end)

wezterm.on('update-status', function(window, _)
  local name = window:active_key_table()
  if name then
    name = 'TABLE: ' .. name
  end
  window:set_right_status(name or '')
end)

return config

