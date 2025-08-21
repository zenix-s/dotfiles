vim.o.number = true
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.relativenumber = true
vim.o.swapfile = false
vim.o.clipboard = "unnamedplus"
vim.o.wrap = false
vim.g.mapleader = " "
vim.o.signcolumn = "yes"
vim.o.winborder = "rounded"
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.cursorline = true
vim.o.completeopt = "menu,menuone,noselect"
vim.o.scrolloff = 10
vim.o.list = true
vim.o.termguicolors = true
vim.o.showmode = false

vim.keymap.set('n', '<leader>so', ':so<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)

vim.pack.add({
    { src = "https://github.com/navarasu/onedark.nvim" },
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/echasnovski/mini.pick" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
    { src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
    { src = "https://github.com/rebelot/kanagawa.nvim" },
})

require("ibl").setup()

-- LSP
vim.lsp.enable({ "lua_ls", "clangd" })

-- Oil
require("oil").setup({
    view_options = {
        show_hidden = true,
    }
})
vim.keymap.set('n', '<leader>o', ':Oil<CR>')

-- Colorscheme
require('onedark').setup {
    style = 'darker'
}
vim.cmd("colorscheme onedark")

-- require("kanagawa").load("wave")
-- vim.cmd("colorscheme kanagawa")

-- mini.pick
require("mini.pick").setup()
vim.keymap.set('n', '<leader>f', ':Pick files<CR>')
vim.keymap.set('n', '<leader>h', ':Pick help<CR>')

-- Mason
require("mason").setup()

-- Treesitter
require('nvim-treesitter.configs').setup({
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
    sync_install = false,
    auto_install = true,
    ignore_install = {},
    highlight = {
        enable = true,
    },
    modules = {}
})

-- Lualine
require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'onedark',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
            refresh_time = 16, -- ~60fps
            events = {
                'WinEnter',
                'BufEnter',
                'BufWritePost',
                'SessionLoadPost',
                'FileChangedShellPost',
                'VimResized',
                'Filetype',
                'CursorMoved',
                'CursorMovedI',
                'ModeChanged',
            },
        }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}

-- gitsigns

require("gitsigns").setup()
