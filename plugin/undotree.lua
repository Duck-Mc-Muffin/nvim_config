-- Open undotree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- If inside a "project" with a personal directory, use that directory for the undofile instead
local personal_dir = GetPersonalDir()
local undodir      = vim.fs.joinpath(vim.fn.stdpath('data'), 'undodir') -- default directory
if personal_dir ~= nil then
    undodir = vim.fs.joinpath(personal_dir, 'undodir')
end

-- Use permanent undofile
vim.opt.swapfile = false
vim.opt.backup   = false
vim.opt.undodir  = undodir
vim.opt.undofile = true
