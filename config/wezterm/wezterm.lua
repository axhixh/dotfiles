local wezterm = require 'wezterm'
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.font_size = 16.0
config.font = wezterm.font('VictorMono Nerd Font Mono', 
  { weight = 'Thin' })
 
return config