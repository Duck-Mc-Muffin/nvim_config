-- Docs: https://cmp.saghen.dev/

local blink = require('blink.cmp')
blink.setup({
    keymap = {
        preset = 'default',
        ['<Tab>'] = { 'select_and_accept', 'fallback' },
        ['<Up>'] = { 'select_prev', 'fallback' },
        ['<Down>'] = { 'select_next', 'fallback' },
    },
    appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
    },
    sources = {
        default = { 'lsp', 'path', 'luasnip', 'snippets', 'buffer', 'dadbod' },
        providers = {
            dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
        },
    },
    completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 50 },
    },
    signature = { enabled = true },

    -- LuaSnip-Integration
    snippets = {
        expand = function(snippet) require('luasnip').lsp_expand(snippet) end,
        active = function(filter)
            if filter and filter.direction then
                return require('luasnip').jumpable(filter.direction)
            end
            return require('luasnip').in_snippet()
        end,
        jump = function(direction) require('luasnip').jump(direction) end,
    },
})

-- Fix command mode completion
vim.keymap.set('c', '<Tab>', '<C-z>', { silent = false })
