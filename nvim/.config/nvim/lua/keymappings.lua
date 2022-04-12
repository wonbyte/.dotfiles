-- clear highlights
vim.api.nvim_set_keymap("n", "<C-h>", "<cmd>noh<CR>", {
  noremap = true,
})

-- <leader>, shows/hides hidden characters
vim.api.nvim_set_keymap("n", "<space>,", ":set invlist<CR>", {
  noremap = true,
})

-- no help when i fat finger F1
vim.api.nvim_set_keymap("n", "<F1>", "<Esc>", {
  noremap = false,
})

vim.api.nvim_set_keymap("i", "<F1>", "<Esc>", {
  noremap = false,
})

-- https://vim.fandom.com/wiki/Simplifying_regular_expressions_using_magic_and_no-magic
vim.api.nvim_set_keymap("n", "?", "?\\v", {
  noremap = true,
})
vim.api.nvim_set_keymap("n", "/", "/\\v", {
  noremap = true,
})

vim.api.nvim_set_keymap("c", "%s/", "%sm/", {
  noremap = true,
})

-- better indenting
vim.api.nvim_set_keymap("v", "<", "<gv", {
  noremap = true,
})

vim.api.nvim_set_keymap("v", ">", ">gv", {
  noremap = true,
})

-- toggle to enable/disable mouse mode
ToggleMouse = function()
  if vim.o.mouse == "a" then
    vim.o.mouse = "v"
    print("Mouse disabled")
  else
    vim.o.mouse = "a"
    print("Mouse enabled")
  end
end

-- enable mouse support
vim.api.nvim_set_keymap("n", "<F10>", "<cmd>lua ToggleMouse()<CR>", {
  noremap = true,
})

-- git branches
vim.api.nvim_set_keymap("n", "<leader>gc", [[<Cmd>lua require'telescope.builtin'.git_branches()<CR>]], {
  noremap = true,
  silent = true,
})

-- git commits
vim.api.nvim_set_keymap("n", "<leader>gl", [[<Cmd>lua require'telescope.builtin'.git_commits()<CR>]], {
  noremap = true,
  silent = true,
})

-- git status <tab> to toggle staging
vim.api.nvim_set_keymap("n", "<leader>gs", [[<Cmd>lua require'telescope.builtin'.git_status()<CR>]], {
  noremap = true,
  silent = true,
})

-- find files
vim.api.nvim_set_keymap(
  "n",
  "<leader>ff",
  [[<Cmd>lua require'telescope.builtin'.find_files({file_ignore_patterns={'.git', 'target', 'node_modules'}})<CR>]],
  {
    noremap = true,
    silent = true,
  }
)

-- live grep
vim.api.nvim_set_keymap("n", "<leader>fg", [[<Cmd>lua require'telescope.builtin'.live_grep()<CR>]], {
  noremap = true,
  silent = true,
})

-- buffers
vim.api.nvim_set_keymap("n", "<leader>fb", [[<Cmd>lua require'telescope.builtin'.buffers()<CR>]], {
  noremap = true,
  silent = true,
})

-- search dotfiles
vim.api.nvim_set_keymap("n", "<leader>vrc", [[<Cmd>lua require'config.telescope'.search_dotfiles()<CR>]], {
  noremap = true,
  silent = true,
})

-- grep word under cursor
vim.api.nvim_set_keymap("n", "<leader>gw", [[<Cmd>lua require'telescope.builtin'.grep_string()<CR>]], {
  noremap = true,
  silent = true,
})

-- open file in directory of current file
vim.api.nvim_set_keymap("n", "<leader>ofe", ":e %:h/", {
  noremap = false,
  silent = false,
})

-- open file in vertical split
vim.api.nvim_set_keymap("n", "<leader>ofv", ":vs %:h/", {
  noremap = false,
  silent = false,
})

-- telescopic johnson approved
vim.api.nvim_set_keymap("n", "<leader>hh", ":Telescope help_tags<CR>", {
  noremap = false,
  silent = false,
})
