local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local default_setup = function(server)
    require('lspconfig')[server].setup({
        capabilities = lsp_capabilities,
    })
end

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {'lua_ls'},
    handlers = {
        default_setup,
    },
})
