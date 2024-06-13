local lsp_zero   = require('lsp-zero')

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

-- Auto format after leaving INSERT for specific files
vim.api.nvim_create_autocmd('InsertLeave', { -- TODO: use some LSP-Hook?
    desc = 'Formats the file after leaving INSERT.',
    group = vim.api.nvim_create_augroup('format_file_after_insert', {}),
    callback = function (opts)
        if vim.bo[opts.buf].filetype == 'rust' then
            local tmp = vim.g.rustfmt_fail_silently
            vim.g.rustfmt_fail_silently = 1
            vim.cmd('RustFmt')
            vim.g.rustfmt_fail_silently = tmp
        end
    end,
})
