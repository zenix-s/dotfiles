return {
  -- {
  --   "MeanderingProgrammer/markdown.nvim",
  --   name = "render-markdown",
  --   config = function()
  --     require("render-markdown").setup({})
  --   end,
  -- },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
}
