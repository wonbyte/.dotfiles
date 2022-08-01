local autocmd = vim.api.nvim_create_autocmd
local create_augroup = vim.api.nvim_create_augroup

create_augroup("Filetypes", { clear = false })
create_augroup("Highlights", { clear = true })

autocmd({ "FileType" }, {
  desc = "set spacing for javascript",
  pattern = "javascript",
  command = "setlocal tabstop=2 softtabstop=2 shiftwidth=2",
  group = "Filetypes",
})

autocmd({ "FileType" }, {
  desc = "set spacing for javascriptreact",
  pattern = "javascriptreact",
  command = "setlocal tabstop=2 softtabstop=2 shiftwidth=2",
  group = "Filetypes",
})

autocmd({ "FileType" }, {
  desc = "set spacing for typescript",
  pattern = "typescript",
  command = "setlocal tabstop=2 softtabstop=2 shiftwidth=2",
  group = "Filetypes",
})

autocmd({ "FileType typescriptreact" }, {
  desc = "set spacing for typescriptreact",
  pattern = "typescriptreact",
  command = "setlocal tabstop=2 softtabstop=2 shiftwidth=2",
  group = "Filetypes",
})

-- highlight on yank
autocmd({ "TextYankPost" }, {
  group = "Highlights",
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 40,
    })
  end,
})
