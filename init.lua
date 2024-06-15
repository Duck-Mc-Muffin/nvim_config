vim.cmd.source(vim.fs.joinpath(vim.fn.stdpath('config'), '.vimrc'))

require('remap')
require('settings')
