vim.cmd.source(vim.fs.joinpath(vim.fn.stdpath('config'), '.vimrc'))

require('lazy-init')
require('mappings')
require('settings')
