local autocmd = vim.api.nvim_create_autocmd
local create_augroup = vim.api.nvim_create_augroup

create_augroup("Filetypes", { clear = false })
create_augroup("Highlights", { clear = true })

autocmd({ "FileType javascript" }, {
  desc = "set spacing for javascript",
  command = "setlocal tabstop=2 softtabstop=2 shiftwidth=2",
  group = "Filetypes",
})

autocmd({ "FileType javascriptreact" }, {
  desc = "set spacing for javascriptreact",
  command = "setlocal tabstop=2 softtabstop=2 shiftwidth=2",
  group = "Filetypes",
})

autocmd({ "FileType typescript" }, {
  desc = "set spacing for typescript",
  command = "setlocal tabstop=2 softtabstop=2 shiftwidth=2",
  group = "Filetypes",
})

autocmd({ "FileType typescriptreact" }, {
  desc = "set spacing for typescriptreact",
  command = "setlocal tabstop=2 softtabstop=2 shiftwidth=2",
  group = "Filetypes",
})

-- highlight on yank
autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 40,
    })
  end,
  group = "Highlights",
  pattern = "*",
})
