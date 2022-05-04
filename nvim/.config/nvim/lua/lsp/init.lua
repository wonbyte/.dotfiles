-- see `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
vim.api.nvim_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
vim.api.nvim_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
vim.api.nvim_set_keymap("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

-- use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
  -- enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- see `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "<space>wl",
    "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
    opts
  )
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

-- enable cmp
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- snippet support
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- enable auto-import
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = { "documentation", "detail", "additionalTextEdits" },
}

-- lua
-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require("lspconfig").sumneko_lua.setup({
  on_attach = function(client, bufnr)
    -- disable formatting, use diagnosticls
    client.resolved_capabilities.document_formatting = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
        -- setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      workspace = {
        -- make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
})

-- go
require("lspconfig").gopls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
})

-- rust
require("lspconfig").rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {
      assist = {
        importGranularity = "module",
        importPrefix = "by_self",
      },
      cargo = {
        loadOutDirsFromCheck = true,
      },
      procMacro = {
        enable = true,
      },
    },
  },
})

-- js/ts
require("lspconfig").tsserver.setup({
  on_attach = function(client, bufnr)
    -- disable formatting, use diagnosticls
    client.resolved_capabilities.document_formatting = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
})

-- diagnosticls
require("lspconfig").diagnosticls.setup({
  filetypes = {
    "javascript",
    "javascriptreact",
    -- "go",
    "lua",
    "typescript",
    "typescriptreact",
  },
  init_options = {
    linters = {
      eslint_d = {
        command = "eslint_d",
        rootPatterns = {
          ".eslintrc",
          ".eslintrc.js",
          ".eslintrc.json",
        },
        debounce = 100,
        args = { "--stdin", "--stdin-filename", "%filepath", "--format", "json" },
        sourceName = "eslint_d",
        parseJson = {
          errorsRoot = "[0].messages",
          line = "line",
          column = "column",
          endLine = "endLine",
          endColumn = "endColumn",
          message = "[eslint] ${message} [${ruleId}]",
          security = "severity",
        },
        securities = { ["1"] = "warning", ["2"] = "error" },
      },
      golangci_lint = {
        sourceName = "golangci_lint",
        command = "golangci-lint",
        args = { "run", "--out-format", "json" },
        debounce = 100,
        parseJson = {
          sourceNameFilter = true,
          sourceName = "Pos.Filename",
          errorsRoot = "Issues",
          line = "Pos.Line",
          column = "Pos.Column",
          message = "[golangci_lint] ${Text} [${FromLinter}]",
        },
        rootPatterns = { ".git", "go.mod" },
      },
    },
    filetypes = {
      javascript = "eslint_d",
      javascriptreact = "eslint_d",
      -- go = "golangci_lint",
      typescript = "eslint_d",
      typescriptreact = "eslint_d",
    },
    formatters = {
      eslint_d = {
        command = "eslint_d",
        args = {
          "--fix-to-stdout",
          "--stdin",
          "--stdin-filename",
          "%filepath",
        },
        rootPatterns = {
          ".eslintrc",
          ".eslintrc.js",
          ".eslintrc.json",
        },
      },
      prettier = {
        command = "prettier",
        args = { "--stdin", "--stdin-filepath", "%filepath" },
        rootPatterns = {
          ".prettierrc",
          ".prettierrc.json",
          ".prettierrc.js",
          "prettier.config.js",
        },
      },
      stylua = {
        command = "stylua",
        args = { "-" },
        rootPatterns = { "stylua.toml", ".stylua.toml" },
        requiredFiles = { "stylua.toml", ".stylua.toml" },
      },
    },
    formatFiletypes = {
      javascript = "prettier",
      javascriptreact = "prettier",
      lua = "stylua",
      typescript = "prettier",
      typescriptreact = "prettier",
    },
  },
})
