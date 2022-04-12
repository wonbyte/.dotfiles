return require("packer").startup(function(use)
  -- packer can manage itself
  use("wbthomason/packer.nvim")

  -- lspconfig
  use("neovim/nvim-lspconfig")

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
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-vsnip" },
      { "hrsh7th/vim-vsnip" },
      { "hrsh7th/vim-vsnip-integ" },
      { "rust-lang/vscode-rust" },
      { "golang/vscode-go" },
    },
    config = function()
      require("config.completion")
    end,
  })

  -- highlight, edit, and navigate code
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("config.highlighting")
    end,
  })

  -- additional textobjects for treesitter
  use("nvim-treesitter/nvim-treesitter-textobjects")

  -- ui to select things (files, grep results, open buffers...
  use({
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
    config = function()
      require("config.finder")
    end,
  })

  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

  -- fancier status line
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = function()
      require("config.statusbar")
    end,
  })

  -- theme
  use({
    "folke/tokyonight.nvim",
    config = function()
      require("config.theme")
    end,
  })
end)
