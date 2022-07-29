local g = vim.g

-- style variant
g.tokyonight_style = "night"
-- set a darker background on sidebar-like windows.
g.tokyonight_sidebars = {
  "qf",
  "vista_kind",
  "terminal",
  "packer",
  "help",
}
-- hide inactive statuslines and replace them with a thin border instead. 
g.tokyonight_hide_inactive_statusline = true
-- sidebar like windows like nvimTree get a darker background
g.tokyonight_dark_sidebar = true
-- float windows like the lsp diagnostics windows get a darker background.
g.tokyonight_dark_float = true

require("tokyonight").colorscheme()
