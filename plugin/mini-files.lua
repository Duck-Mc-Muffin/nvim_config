local mini_files = require('mini.files')

mini_files.setup({
    mappings = {
        go_in_plus = '<cr>'
    }
})

vim.keymap.set('n', '<leader>q', function()
    mini_files.open()
end, {desc = "Open mini.file-explorer"})

-- Open the current file in mini-files but don't set the anchor directory
vim.api.nvim_create_user_command('Where', function(_)
    MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
end, {})
