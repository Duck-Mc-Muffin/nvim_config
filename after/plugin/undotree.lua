-- Tree öffnen
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- Keine Vim Backups, sondern eine Undo-Datei die permanent ist
vim.opt.swapfile = false
vim.opt.backup   = false
vim.opt.undodir  = vim.fs.joinpath(vim.fn.stdpath('data'), 'undodir')
vim.opt.undofile = true
