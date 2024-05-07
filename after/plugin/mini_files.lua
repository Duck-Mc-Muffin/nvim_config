local mini_files = require('mini.files')

mini_files.setup({
    mappings = {
        go_in_plus = ';'
    }
})

vim.keymap.set('n', '<leader>q', function()
    mini_files.open()
end, {desc = "Open mini.file-explorer"})
