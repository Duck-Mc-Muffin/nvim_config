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
    local buf_file      = vim.api.nvim_buf_get_name(0)
    local buf_file_name = vim.fs.basename(buf_file)
    local buf_dir       = vim.fs.dirname(buf_file)
    local found_file    = vim.fs.find(buf_file_name, {type = 'file', path = buf_dir})[1]
    if found_file == nil then
        MiniFiles.open(buf_dir, false)
    else
        MiniFiles.open(buf_file, false)
    end
end, {})
