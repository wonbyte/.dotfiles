require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash",
    "c",
    "cpp",
    "css",
    "dockerfile",
    "html",
    "go",
    "graphql",
    "javascript",
    "jsdoc",
    "json",
    "jsonc",
    "lua",
    "rust",
    "scss",
    "typescript",
    "tsx",
    "toml",
    "vim",
    "yaml",
  },
  highlight = {
    enable = {
      "bash",
      "c",
      "cpp",
      "css",
      "dockerfile",
      "html",
      "go",
      "graphql",
      "javascript",
      "jsdoc",
      "json",
      "jsonc",
      "lua",
      "rust",
      "scss",
      "typescript",
      "tsx",
      "toml",
      "vim",
      "yaml",
    },
    additional_vim_regex_highlighting = false,
  },
})