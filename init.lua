vim.cmd.source(vim.fs.joinpath(vim.fn.stdpath('config'), '.vimrc'))

-- Set global OS detection variable
if not vim.g.os then
    local is_windows = vim.fn.has("win64") or vim.fn.has("win32") or vim.fn.has("win16")
    if is_windows then
        vim.g.os = "Windows"
    else
        vim.g.os = string.gsub(vim.fn.system('uname'), '\\n', '')
    end
end

function GetPersonalDir()
    return vim.fs.find('.steven/nvim', {type = 'directory', upward = true})[1]
end

---@param callback function
---@return TSNode?
function FindParentFromCursor(callback)
    -- FIXME: Is a bit flaky after yanking and pasting something
    local ts_utils = require('nvim-treesitter.ts_utils')
    local node = ts_utils.get_node_at_cursor()
    if not node then
        print('No node at cursor.')
        return nil
    end
    while node do
        if not node or callback(node) then
            break
        end
        node = node:parent()
    end
    if not node then
        print('No captured parent at cursor.')
        return nil
    end
    return node
end

require('lazy-init')
require('mappings')
require('settings')

