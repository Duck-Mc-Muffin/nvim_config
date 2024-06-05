require('sp.remap')
require('sp.lazy')
require('sp.bool').setup({
    mappings = {
        increment = '<C-a>',
        decrement = '<C-x>'
    },
})

-- hightlighted yank
vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('highlight_yank', {}),
    desc = 'Hightlight selection on yank',
    pattern = '*',
    callback = function()
        vim.highlight.on_yank { higroup = 'IncSearch', timeout = 200 }
    end,
})
