return {
  "olimorris/onedarkpro.nvim",
  priority = 1000,
  config = function()
    require("onedarkpro").setup({
      colors = {
        cursorline = "#2f343d"
      },
      options = {
        cursorline = true
      }
    })
    vim.cmd.colorscheme "onedark_vivid"
  end,
}
--return {
--  "navarasu/onedark.nvim",
--  priority = 1000,
--  config = function()
--    -- Lua
--    require('onedark').setup {
--      style = 'darker'
--    }
--    require('onedark').load()
--  end,
--}
