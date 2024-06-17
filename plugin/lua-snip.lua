local ls = require('luasnip')

ls.config.set_config({
    -- history      = false,
    updateevents = 'TextChanged,TextChangedI',
    enable_autosnippets = true,
    store_selection_keys = "<Tab>",
})

-- Load file type snippets
require('luasnip.loaders.from_lua').lazy_load({
    paths = vim.fs.joinpath(vim.fn.stdpath('config'), 'luasnip')
})

-- "manual" loading example
-- for _, snippet_file in ipairs(vim.api.nvim_get_runtime_file('lua/snippets/*.lua', true)) do
--     loadfile(snippet_file)()
-- end

vim.keymap.set({'i', 's'}, '<C-l>', function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = true })

vim.keymap.set({'i', 's'}, '<C-h>', function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, { silent = true })
