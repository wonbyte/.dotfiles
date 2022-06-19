-- clear highlights
vim.keymap.set("n", "<C-h>", "<cmd>noh<CR>")

-- <leader>, shows/hides hidden characters
vim.keymap.set("n", "<space>,", ":set invlist<CR>")

-- no help when i fat finger F1
vim.keymap.set("n", "<F1>", "<Nop>")
vim.keymap.set("i", "<F1>", "<Nop>")

-- https://vim.fandom.com/wiki/Simplifying_regular_expressions_using_magic_and_no-magic
vim.keymap.set("n", "?", "?\\v")
vim.keymap.set("n", "/", "/\\v")
vim.keymap.set("c", "%s/", "%sm/")

-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- toggle to enable/disable mouse mode
local ToggleMouse = function()
  if vim.o.mouse == "a" then
    vim.o.mouse = "v"
    print("Mouse disabled")
  else
    vim.o.mouse = "a"
    print("Mouse enabled")
  end
end

-- enable mouse support
vim.keymap.set("n", "<F10>", "<cmd>lua ToggleMouse()<CR>")

-- git branches
vim.keymap.set("n", "<leader>gb", require("telescope.builtin").git_branches)

-- git commits
vim.keymap.set("n", "<leader>gc", require("telescope.builtin").git_commits)

-- git status <tab> to toggle staging
vim.keymap.set("n", "<leader>gs", require("telescope.builtin").git_status)

-- find files current buffer
vim.keymap.set(
  "n",
  "<leader>fb",
  require("telescope.builtin").current_buffer_fuzzy_find
)

-- find files
vim.keymap.set("n", "<leader>ff", function()
  require("telescope.builtin").find_files({
    file_ignore_patterns = { ".git", "target", "node_modules" },
  })
end)

-- live grep
vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep)

-- buffers
vim.keymap.set("n", "<leader>cb", require("telescope.builtin").buffers)

-- search dotfiles
vim.keymap.set("n", "<leader>rc", require("config.finder").search_dotfiles)

-- grep word under cursor
vim.keymap.set("n", "<leader>gw", require("telescope.builtin").grep_string)

-- telescopic johnson approved
vim.keymap.set("n", "<leader>hh", ":Telescope help_tags<CR>")

-- see `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
