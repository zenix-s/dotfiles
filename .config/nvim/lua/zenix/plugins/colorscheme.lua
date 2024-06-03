-- return {
--  "olimorris/onedarkpro.nvim",
--  priority = 1000,
--  config = function()
--    require("onedarkpro").setup({
--      colors = {
--        cursorline = "#2f343d"
--      },
--      options = {
--        cursorline = true
--      } })
--    vim.cmd.colorscheme "onedark_vivid"
--  end,
-- }
return {
  "navarasu/onedark.nvim",
  priority = 1000,
  config = function()
    -- Lua
    require('onedark').setup {
      style = 'deep'
    }
    require('onedark').load()
  end,
}
-- return {
--   "catppuccin/nvim",
--   name = "catppuccin",
--   priority = 1000,
--   config = function()
--     require("catppuccin").setup({
--       flavour = "mocha",
--     })
--     vim.cmd.colorscheme "catppuccin"
--   end,
-- }
-- return {
--   "rebelot/kanagawa.nvim",
--   config = function()
--     require("kanagawa").setup({
--       theme = "dragon",
--     })
--     require("kanagawa").load("wave")
--   end,
-- }
