local wezterm = require 'wezterm'
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.font_size = 16.0
-- config.font = wezterm.font('VictorMono Nerd Font Mono', 
--  { weight = 'Thin' })
config.font = wezterm.font('CommitMonoaxhixh') 

config.color_scheme = 'Atelierheath (light) (terminal.sexy)'

config.window_decorations = 'INTEGRATED_BUTTONS'

return config
