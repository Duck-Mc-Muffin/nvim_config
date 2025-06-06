local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set('n', '<leader>a', function() mark.add_file(); print('[Harpoon] Marked current file.') end)
vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu)

vim.keymap.set('n', '<C-h>', function() ui.nav_prev() end)
vim.keymap.set('n', '<C-l>', function() ui.nav_next() end)
