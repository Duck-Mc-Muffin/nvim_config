local lsnip = require('luasnip')

lsnip.config.set_config({
    -- history      = false,
    updateevents = 'TextChanged,TextChangedI',
})

for _, snippet_file in ipairs(vim.api.nvim_get_runtime_file('lua/snippets/*.lua', true)) do
    loadfile(snippet_file)()
end

vim.keymap.set({'i', 's'}, '<C-l>', function()
    if lsnip.expand_or_jumpable() then
        lsnip.expand_or_jump()
    end
end, { silent = true })

vim.keymap.set({'i', 's'}, '<C-h>', function()
    if lsnip.jumpable(-1) then
        lsnip.jump(-1)
    end
end, { silent = true })
