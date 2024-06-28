vim.cmd.source(vim.fs.joinpath(vim.fn.stdpath('config'), '.vimrc'))

function GetPersonalDir()
    return vim.fs.find('.steven/nvim', {type = 'directory', upward = true})[1]
end

require('lazy-init')
require('mappings')
require('settings')
