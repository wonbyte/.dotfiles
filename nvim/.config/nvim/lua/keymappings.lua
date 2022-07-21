local set = vim.keymap.set

-- clear highlights
set("n", "<C-h>", "<cmd>noh<CR>")

-- <leader>, shows/hides hidden characters
set("n", "<space>,", ":set invlist<CR>")

-- no help when i fat finger F1
set("n", "<F1>", "<Nop>")
set("i", "<F1>", "<Nop>")

-- https://vim.fandom.com/wiki/Simplifying_regular_expressions_using_magic_and_no-magic
set("n", "?", "?\\v")
set("n", "/", "/\\v")
set("c", "%s/", "%sm/")

-- better indenting
set("v", "<", "<gv")
set("v", ">", ">gv")

-- enable/disable mouse
function ToggleMouse()
  if vim.o.mouse == "a" then
    vim.o.mouse = "v"
    print("Mouse disabled")
  else
    vim.o.mouse = "a"
    print("Mouse enabled")
  end
end

-- toggle mouse
set("n", "<F10>", "<cmd>lua ToggleMouse()<CR>")

-- git branches
set("n", "<leader>gb", require("config.finder").git_branches)

-- git commits
set("n", "<leader>gc", require("telescope.builtin").git_commits)

-- git status <tab> to toggle staging
set("n", "<leader>gs", require("telescope.builtin").git_status)

-- find files current buffer
set("n", "<leader>fb", require("telescope.builtin").current_buffer_fuzzy_find)

-- find files
set("n", "<leader>ff", function()
  require("telescope.builtin").find_files({
    file_ignore_patterns = { ".git", "target", "node_modules" },
  })
end)

-- live grep
set("n", "<leader>fg", require("telescope.builtin").live_grep)

-- buffers
set("n", "<leader>cb", require("telescope.builtin").buffers)

-- search dotfiles
set("n", "<leader>rc", require("config.finder").search_dotfiles)

-- grep word under cursor
set("n", "<leader>gw", require("telescope.builtin").grep_string)

-- telescopic johnson approved
set("n", "<leader>hh", ":Telescope help_tags<CR>")

-- see `:help vim.diagnostic.*` for documentation on any of the below functions
set("n", "<leader>e", vim.diagnostic.open_float)
set("n", "[d", vim.diagnostic.goto_prev)
set("n", "]d", vim.diagnostic.goto_next)
set("n", "<leader>q", vim.diagnostic.setloclist)
