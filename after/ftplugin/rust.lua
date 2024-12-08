-- TODO: read from .toml
vim.opt_local.textwidth = 140

-- Auto format after leaving INSERT
vim.api.nvim_create_autocmd({'InsertLeave', 'BufWritePre'}, {
    desc = 'Formats the file after leaving -- INSERT --.',
    group = vim.api.nvim_create_augroup('format_file_after_insert', {}),
    buffer = 0,
    callback = function ()
        vim.lsp.buf.format()
    end
})
