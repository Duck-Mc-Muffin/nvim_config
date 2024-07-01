local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', function()
    builtin.find_files({ find_command = {
        'rg',
        '--files',
        '-g', '!obj',
        '-g', '!bin',
    }})
end, {desc = "Telescope find files"})
