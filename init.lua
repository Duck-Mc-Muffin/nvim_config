vim.cmd.source(vim.fs.joinpath(vim.fn.stdpath('config'), '.vimrc'))

require('lazy-init')
require('remap')
require('settings')
