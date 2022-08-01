return require("packer").startup(function(use)
  -- packer can manage itself
  use("wbthomason/packer.nvim")

  -- lsp config
  use("neovim/nvim-lspconfig")

  -- lsp installer
  use("williamboman/nvim-lsp-installer")

  -- autopairs
  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  })

  -- completion framework and Snippets
  use({
    "hrsh7th/nvim-cmp",
    requires = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },
      { "hrsh7th/cmp-nvim-lsp-signature-help" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-vsnip" },
      { "hrsh7th/vim-vsnip" },
      { "hrsh7th/vim-vsnip-integ" },
      { "rust-lang/vscode-rust" },
    },
    config = function()
      require("config.cmp")
    end,
  })

  -- highlight, edit, and navigate code
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("config.treesitter")
    end,
  })

  -- additional textobjects for treesitter
  use("nvim-treesitter/nvim-treesitter-textobjects")

  -- ui to select things (files, grep results, open buffers...
  use({
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
    config = function()
      require("config.telescope")
    end,
  })

  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

  -- fancier status line
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = function()
      require("config.lualine")
    end,
  })

  -- lightbuld (codeactions)
  use({
    "kosayoda/nvim-lightbulb",
    requires = "antoinemadec/FixCursorHold.nvim",
    config = function()
      require("nvim-lightbulb").setup({ autocmd = { enabled = true } })
    end,
  })

  -- theme
  use({
    "folke/tokyonight.nvim",
    config = function()
      require("config.tokyonight")
    end,
  })

  -- progress spinners
  use({
    "j-hui/fidget.nvim",
    config = function()
      require"fidget".setup{}
    end,
  })

  -- use("~/src/personnel/plugins/stackmap.nvim/")
end)
