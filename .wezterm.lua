local wezterm = require 'wezterm';
return {
  -- Don't be used as login shell.
  default_prog = {'/bin/bash'},
  initial_cols = 120,
  initial_rows = 32,
  font = wezterm.font('Roboto Mono'),
  font_size = 12,
  color_scheme = 'Vaughn',
  exit_behavior = 'Close',
}
