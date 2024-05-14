return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    local treesitter = require("nvim-treesitter.configs")

    treesitter.setup({
      highlight = {
        enable = true,
      },
      indent = {
        enable = true
      },
      autotag = {
        enable = true,
      },
      ensure_installed = {
        "json",
        "c",
        "html",
        "css",
        "javascript",
        "typescript",
        "angular",
        "bash",
        "cmake",
        "yaml",
        "vim",
        "lua"
      },
    })

  end,
}
