local g = vim.g
local opt = vim.opt

-- leader key
g.mapleader = " "

-- file explorer
g.netrw_browse_split = 0
g.netrw_banner = 0
g.netrw_winsize = 25

-- rgb colors
opt.termguicolors = true

-- insert mode completion
opt.completeopt = "menu,menuone,noselect"

-- line numbers
opt.number = true

-- realative line numbers
opt.relativenumber = true

-- keep some room around cursor
opt.scrolloff = 8

-- cmd line height
opt.cmdheight = 1

-- no swap file
opt.swapfile = false

-- no backup file
opt.backup = false

-- no undo file
opt.undofile = false

-- incremental live completion
opt.inccommand = "nosplit"

-- avoid showing message extra message when using completion
opt.shortmess:append("c")

-- case insensitive searching UNLESS /C or capital in search
opt.ignorecase = true
opt.smartcase = true

-- longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
opt.updatetime = 50

-- 80 character lines
opt.signcolumn = "yes"
opt.colorcolumn = "80"

-- enable system clipboard
opt.clipboard = "unnamedplus"

-- handle spaces and indents
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.shiftround = true
opt.smartcase = true

-- set list characters
opt.listchars:append("space:⋅")
opt.listchars:append("eol:↴")
opt.listchars:append("extends:»")
opt.listchars:append("precedes:«")
opt.listchars:append("trail:•")

-- command line completion
opt.wildmode = "longest,list,full"
opt.wildignore = { "*/.git/*", "*/node_modules/*", "*/target/*" }
