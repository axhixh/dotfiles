local wezterm = require 'wezterm'
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

local function segments_for_right_status(window)
  return {
    window:active_workspace(),
    wezterm.strftime('%a %b %-d %H:%M'),
    -- wezterm.hostname(),
  }
end

wezterm.on('update-status', function(window, _)
  local SOLID_LEFT_ARROW = utf8.char(0xe0b2)
  local segments = segments_for_right_status(window)

  local color_scheme = window:effective_config().resolved_palette
  -- parsing to convert to Color object so we can lighten/darken
  local bg = wezterm.color.parse("purple")
  local fg = wezterm.color.parse("white")
  -- each segment is darker/lighter
  local gradient_to, gradient_from = bg
  gradient_from = gradient_to:darken(0.3)
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

config.font_size = 16.0
-- config.font = wezterm.font('VictorMono Nerd Font Mono',
--  { weight = 'Thin' })
config.font = wezterm.font('CommitMonoaxhixh')

config.color_scheme = 'Atelierheath (light) (terminal.sexy)'

config.window_decorations = 'INTEGRATED_BUTTONS'

return config
