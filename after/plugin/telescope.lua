local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "Telescope find files"})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {desc = "Telescope find with live grep (cooler)"})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = "Telescope find in buffers"})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = "Telescope find help tags"})
vim.keymap.set('n', '<C-p>', builtin.git_files, {desc = "Telescope find in git files"})
vim.keymap.set('n', '<leader>fr', function()
  builtin.grep_string({search = vim.fn.input("Grep > ")});
end, {desc = "Telescope find vim search and grep_string"})

