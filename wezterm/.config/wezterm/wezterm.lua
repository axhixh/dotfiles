local wezterm = require 'wezterm'

local function segments_for_right_status(window)
  return {
    window:active_workspace(),
    -- wezterm.strftime('%a %b %-d %H:%M'),
    -- wezterm.hostname(),
  }
end

wezterm.on('update-status', function(window, _)
  local SOLID_LEFT_ARROW = utf8.char(0xe0b2)
  local segments = segments_for_right_status(window)

  -- parsing to convert to Color object so we can lighten/darken
  local bg = wezterm.color.parse("purple")
  local fg = wezterm.color.parse("white")
  -- each segment is darker/lighter
  local gradient_to = bg
  local gradient_from = gradient_to:darken(0.3)
  local gradient = wezterm.color.gradient(
    {
      orientation = 'Horizontal',
      colors = { gradient_from, gradient_to },
    },
    -- number os colors == number of segments
    #segments
  )

  local elements = {}
  for i, seg in ipairs(segments) do
    local is_first = i == 1
    if is_first then
      table.insert(elements, { Background = { Color = 'none' } })
    end
    table.insert(elements, { Foreground = { Color = gradient[i] } })
    table.insert(elements, { Text = SOLID_LEFT_ARROW })
    table.insert(elements, { Foreground = { Color = fg } })
    table.insert(elements, { Background = { Color = gradient[i] } })
    table.insert(elements, { Text = ' ' .. seg .. ' ' })
  end

  window:set_right_status(wezterm.format(elements))
end)

local config = wezterm.config_builder()

-- panes
local act = wezterm.action

config.keys = {
  {
    key = "PageUp",
    mods = 'ALT|CTRL',
    action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = "PageDown",
    mods = 'ALT|CTRL',
    action = act.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = "UpArrow",
    mods = "ALT",
    action = act.ActivatePaneDirection('Up')
  },
  {
    key = "DownArrow",
    mods = "ALT",
    action = act.ActivatePaneDirection('Down')
  },
  {
    key = "LeftArrow",
    mods = "ALT",
    action = act.ActivatePaneDirection('Left')
  },
  {
    key = "RightArrow",
    mods = "ALT",
    action = act.ActivatePaneDirection('Right')
  },
}

local function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Light'
end

local function scheme_for_appearance(appearance)
  --if appearance:find 'Dark' then
    return 'Tokyo Night'
  --else
  --  return 'Tokyo Night Light (Gogh)'
  --end
end

config.line_height = 1.05 -- slightly more breathing room than default
config.font_size = 14.5
local is_macos = wezterm.target_triple:find('darwin') ~= nil
local screen = wezterm.gui.get_screen_info()

if is_macos or screen.dpi > 140 then
  config.font = wezterm.font('Victor Mono')
else
  -- maple mono is rounded font that works even on 127ppi screens
  config.font = wezterm.font('Maple Mono')
end 
config.color_scheme = scheme_for_appearance(get_appearance())
config.window_decorations = 'INTEGRATED_BUTTONS'

return config

-- https://alexplescan.com/posts/2024/08/10/wezterm/
