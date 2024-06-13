-- Install Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({ import = 'plugins-lazy' })

--    {
--        'nvim-telescope/telescope.nvim',
--        tag = '0.1.4',
--        dependencies = { 'nvim-lua/plenary.nvim' },
--        opts = {
--            defaults = {
--                vimgrep_arguments = {
--                    'rg',
--                    '--color=never',
--                    '--no-heading',
--                    '--with-filename',
--                    '--line-number',
--                    '--column',
--                    '--smart-case',
--                    '--hidden' -- also search hidden files
--                },
--            },
--        },
--    },
--    {
--        'nvim-treesitter/nvim-treesitter',
--        build = ':TSUpdate',
--    },
--    {
--        'rebelot/kanagawa.nvim',
--        config = function()
--            -- Themes: wave, dragon, lotus
--            vim.cmd("colorscheme kanagawa-wave")
--        end,
--    },
--    {'ThePrimeagen/harpoon'},
--    {'mbbill/undotree'},
--    {
--        "NeogitOrg/neogit",
--        dependencies = {
--            "nvim-lua/plenary.nvim",
--            "sindrets/diffview.nvim",
--            "nvim-telescope/telescope.nvim",
--        },
--        config = true,
--        event = "VeryLazy"
--    },
--    {
--        'echasnovski/mini.files',
--        version = '*'
--    },
--    {
--        "jellydn/hurl.nvim",
--        dependencies = {
--            "MunifTanjim/nui.nvim",
--            "nvim-lua/plenary.nvim",
--            "nvim-treesitter/nvim-treesitter"
--        },
--        ft = "hurl",
--        opts = {
--            -- Show debugging info
--            debug = false,
--            -- Show notification on run
--            show_notification = false,
--            -- Show response in popup or split
--            mode = "split",
--            -- Default formatter
--            formatters = {
--                json = { 'jq' }, -- Make sure you have install jq in your system, e.g: brew install jq
--                -- html = {
--                    --   'prettier', -- Make sure you have install prettier in your system, e.g: npm install -g prettier
--                    --   '--parser',
--                    --   'html',
--                    -- },
--            },
--        },
--        keys = {
--            -- Run API request
--            { "<leader>hh", "<cmd>HurlRunnerAt<CR>", desc = "Run Api request" },
--            { "<leader>ha", "<cmd>HurlRunner<CR>", desc = "Run All requests" },
--            { "<leader>ht", "<cmd>HurlRunnerToEntry<CR>", desc = "Run Api request to entry" },
--            { "<leader>hm", "<cmd>HurlToggleMode<CR>", desc = "Hurl Toggle Mode" },
--            { "<leader>hv", "<cmd>HurlVerbose<CR>", desc = "Run Api in verbose mode" },
--            -- Run Hurl request in visual mode
--            { "<leader>h", ":HurlRunner<CR>", desc = "Hurl Runner", mode = "v" },
--        },
--        event = "VeryLazy"
--    },
--    {
--        "tpope/vim-dadbod",
--        "kristijanhusak/vim-dadbod-completion",
--        "kristijanhusak/vim-dadbod-ui",
--    },
--    --{'tikhomirov/vim-glsl'}, -- GLSL syntax highlighting
--
--    -- LSP
--    {'williamboman/mason.nvim'},
--    {'williamboman/mason-lspconfig.nvim'},
--    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
--    {'neovim/nvim-lspconfig'},
--    {'hrsh7th/cmp-nvim-lsp'},
--    {'hrsh7th/cmp-nvim-lsp-signature-help'},
--    {'hrsh7th/nvim-cmp'},
--    {'L3MON4D3/LuaSnip'},
