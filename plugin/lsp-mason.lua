local lsp_zero = require('lsp-zero')
local lsp_config = require('lspconfig')

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {'lua_ls'},
    handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
            local opts = lsp_zero.nvim_lua_ls()
            lsp_config.lua_ls.setup(opts)
        end,
    }
})
