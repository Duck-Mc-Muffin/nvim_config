vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-- hightlighted yank
vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('highlight_yank', {}),
    desc = 'Hightlight selection on yank',
    pattern = '*',
    callback = function()
        vim.highlight.on_yank { higroup = 'IncSearch', timeout = 200 }
    end,
})

-- live preview for substitutions (and others) in a split window
vim.opt.inccommand = "split"
