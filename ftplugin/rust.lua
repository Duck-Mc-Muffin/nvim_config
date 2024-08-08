-- Auto format after leaving INSERT
vim.api.nvim_create_autocmd({'InsertLeave', 'BufWritePre'}, {
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
