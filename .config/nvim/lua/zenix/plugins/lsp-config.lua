return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.tsserver.setup({
        capabilities = capabilities,
      })
      lspconfig.html.setup({
        capabilities = capabilities,
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.clangd.setup({
        capabilities = capabilities,
      })
      lspconfig.tsserver.setup({
        capabilities = capabilities,
      })
      lspconfig.angularls.setup({
        capabilities = capabilities,
      })
      lspconfig.tailwindcss.setup({
        capabilities = capabilities,
      })
      lspconfig.cmake.setup({
        capabilities = capabilities,
      })
    end,
    keys = {
      {
        "K",
        vim.lsp.buf.hover,
        { mode = "n", desc = "Show hover information" },
      },
      {
        "<leader>gr",
        vim.lsp.buf.references,
        { mode = "n", desc = "Show references" },
      },
      {
        "<leader>ca",
        vim.lsp.buf.code_action,
        { mode = "n", desc = "Show code actions" },
      },
      {
        "<leader>re",
        vim.lsp.buf.rename,
        { mode = "n", desc = "Rename symbol" },
      },
      {
        "<leader>gd",
        vim.lsp.buf.definition,
        { mode = "n", desc = "Go to definition" },
      }
    },
  },
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.clang_format,
        },
      })
    end,
    keys = {
      {
        "<leader>gf",
        vim.lsp.buf.format,
        { mode = "n", desc = "Format buffer" },
      },
    },
  },
}
