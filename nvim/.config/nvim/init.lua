-- sensible settings
require("settings")

-- sensible keymappings
require("keymappings")

-- plugin setup
require("plugins")

-- lsp install (TODO: figure out why this doesn't work in packer `config`)
require("nvim-lsp-installer").setup({
  ensure_installed = {
    "diagnosticls",
    "eslint",
    "rust_analyzer",
    "sumneko_lua",
    "tsserver",
  },
})

-- lsp setup
require("lsp")

-- custom commands
require("config.aucommands")
