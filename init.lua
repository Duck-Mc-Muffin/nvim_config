vim.cmd.source(vim.fs.joinpath(vim.fn.stdpath('config'), '.vimrc'))

vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

require('sp')
