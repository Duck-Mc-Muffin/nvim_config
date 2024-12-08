-- Conceal links, etc. in Markdown files
vim.opt_local.conceallevel = 2

-- Toggle conceallevel when switching to INSERT mode
vim.api.nvim_create_autocmd({'InsertLeave'}, {
    desc = 'Enable conceallevel after leaving INSERT.',
    group = vim.api.nvim_create_augroup('enable_conceallevel_after_insert', {}),
    buffer = 0,
    callback = function (_)
        vim.opt_local.conceallevel = 2
    end,
})
vim.api.nvim_create_autocmd({'InsertEnter'}, {
    desc = 'Disable conceallevel after entering INSERT.',
    group = vim.api.nvim_create_augroup('disable_conceallevel_before_insert', {}),
    buffer = 0,
    callback = function (_)
        vim.opt_local.conceallevel = 0
    end,
})
