local lsp_zero = require('lsp-zero')
local cmp      = require('cmp')

local cmp_select = {behavior = cmp.SelectBehavior.Select}
cmp.setup({
    sources = {
        {name = 'path'},
        {name = 'nvim_lsp'},
        {name = 'nvim_lua'},
        {name = 'buffer'},
        {name = 'nvim_lsp_signature_help'},
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
        ['<Enter>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
    }),
    formatting = lsp_zero.cmp_format(),

    -- LuaSnip-Integration
    snippet = {
        expand = function (args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
})
