local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {'lua_ls'},
    handlers = {
        function(server)
    require('lspconfig')[server].setup({
        capabilities = lsp_capabilities,
    })
end
,
    },
})
