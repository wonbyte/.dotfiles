local cmd = vim.cmd
local g = vim.g
local o = vim.o
local wo = vim.wo
local bo = vim.bo
local opt = vim.opt

cmd("syntax enable")
cmd("filetype plugin indent on")
cmd("set noswapfile")

-- show relative line numbers
wo.number = true
wo.relativenumber = true

-- show cursor at line
wo.cursorline = true

-- keep some room around cursor
o.scrolloff = 4
wo.scrolloff = 4

-- make cmd line little taller
o.cmdheight = 2

-- don't need backups when git
g.nowb = true

-- incremental live completion
o.inccommand = "nosplit"

-- make line numbers default
wo.number = true

-- do not save when switching buffers
o.hidden = true

-- avoid showing message extra message when using completion
o.shortmess = vim.o.shortmess .. "c"

-- enable break indent
o.breakindent = true

-- case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true

-- decrease update time
o.updatetime = 50

-- 120 character lines
wo.signcolumn = "yes"
wo.colorcolumn = "120"

-- enable system clipboard
o.clipboard = "unnamedplus"

-- leader key
g.mapleader = " "
g.maplocalleader = " "

-- handle spaces and indents
bo.shiftwidth = 4
bo.tabstop = 4
bo.softtabstop = 4

cmd([[
set expandtab smarttab shiftround autoindent smartindent smartcase
set path+=**
set wildmenu
set wildmode=longest,list,full
set wildignore+=**/target/*
set wildignore+=**/.git/*
set wildignore+=**/node_modules/*
]])

-- highlight on yank
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
  false
)

-- Y yank until the end of line
vim.api.nvim_set_keymap("n", "Y", "y$", {
  noremap = true,
})

-- set list characters
opt.list = false
opt.listchars:append("space:⋅")
opt.listchars:append("eol:↴")
opt.listchars:append("extends:»")
opt.listchars:append("precedes:«")
opt.listchars:append("trail:•")
