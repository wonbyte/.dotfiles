-- leader key
vim.g.mapleader = " "

-- file explorer
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- rgb colors
vim.opt.termguicolors = true

-- line numbers
vim.opt.number = true

-- realative line numbers
vim.opt.relativenumber = true

-- keep some room around cursor
vim.opt.scrolloff = 8

-- cmd line height
vim.opt.cmdheight = 1

-- no swap file
vim.opt.swapfile = false

-- no backup file
vim.opt.backup = false

-- no undo file
vim.opt.undofile = false

-- incremental live completion
vim.opt.inccommand = "nosplit"

-- avoid showing message extra message when using completion
vim.opt.shortmess:append("c")

-- case insensitive searching UNLESS /C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50

-- 80 character lines
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"

-- enable system clipboard
vim.opt.clipboard = "unnamedplus"

-- handle spaces and indents
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.shiftround = true
vim.opt.smartcase = true

-- set list characters
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")
vim.opt.listchars:append("extends:»")
vim.opt.listchars:append("precedes:«")
vim.opt.listchars:append("trail:•")

-- command line completion
vim.opt.wildmode = "longest,list,full"
vim.opt.wildignore = { "*/.git/*", "*/node_modules/*", "*/target/*" }
