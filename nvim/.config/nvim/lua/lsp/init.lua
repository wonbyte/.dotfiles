local lspconf = require("lspconfig")

-- use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
  -- enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- see `:help vim.lsp.*` for documentation on any of the below functions
  local opts = { buffer = bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set("n", "<leader>wl", function()
    vim.inspect(vim.lsp.buf.list_workspace_folders())
  end, opts)
  vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>f", vim.lsp.buf.formatting, opts)
end

-- enable cmp
local capabilities = require("cmp_nvim_lsp").update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

-- snippet support
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- enable auto-import
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = { "documentation", "detail", "additionalTextEdits" },
}

-- lsp binaries
require("nvim-lsp-installer").setup({
  ensure_installed = {
    "diagnosticls",
    "eslint",
    "rust_analyzer",
    "sumneko_lua",
    "tsserver",
  },
})

-- lua
-- make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lspconf.sumneko_lua.setup({
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

-- rust
lspconf.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- js/ts
lspconf.tsserver.setup({
  on_attach = function(client, bufnr)
    -- disable formatting, use diagnosticls
    client.resolved_capabilities.document_formatting = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
})

-- terraformls
lspconf.terraformls.setup({})

-- diagnosticls
lspconf.diagnosticls.setup({
  filetypes = {
    "javascript",
    "javascriptreact",
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
        args = {
          "--stdin",
          "--stdin-filename",
          "%filepath",
          "--format",
          "json",
        },
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
    },
    filetypes = {
      javascript = "eslint_d",
      javascriptreact = "eslint_d",
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
      -- prettier = {
      --   command = "prettier",
      --   args = { "--stdin", "--stdin-filepath", "%filepath" },
      --   rootPatterns = {
      --     ".prettierrc",
      --     ".prettierrc.json",
      --     ".prettierrc.js",
      --     "prettier.config.js",
      --   },
      -- },
      stylua = {
        command = "stylua",
        args = { "-" },
        rootPatterns = { "stylua.toml", ".stylua.toml" },
        requiredFiles = { "stylua.toml", ".stylua.toml" },
      },
    },
    formatFiletypes = {
      javascript = "eslint_d",
      javascriptreact = "eslint_d",
      lua = "stylua",
      typescript = "eslint_d",
      typescriptreact = "eslint_d",
    },
  },
})
