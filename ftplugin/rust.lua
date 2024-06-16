local lsp_zero = require('lsp-zero')

-- Auto format on save
lsp_zero.format_on_save({
    format_opts = {
        async = false,
        timeout_ms = 10000,
    },
    servers = {
        rust_analyzer = {'rust'},
    }
})

-- Auto format after leaving INSERT
vim.api.nvim_create_autocmd('InsertLeave', {
    desc = 'Formats the file after leaving -- INSERT --.',
    group = vim.api.nvim_create_augroup('format_file_after_insert', {}),
    buffer = 0,
    callback = function (_)
        local tmp = vim.g.rustfmt_fail_silently
        vim.g.rustfmt_fail_silently = 1
        vim.cmd('RustFmt')
        vim.g.rustfmt_fail_silently = tmp
    end,
})
