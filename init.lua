vim.cmd.source(vim.fs.joinpath(vim.fn.stdpath('config'), '.vimrc'))

-- function dumpvar(data)
--     -- cache of tables already printed, to avoid infinite recursive loops
--     local tablecache = {}
--     local buffer = ""
--     local padder = "    "
--     local function _dumpvar(d, depth)
--         local t = type(d)
--         local str = tostring(d)
--         if (t == "table") then
--             if (tablecache[str]) then
--                 -- table already dumped before, so we dont
--                 -- dump it again, just mention it
--                 buffer = buffer.."<"..str..">\n"
--                 -- buffer.
--                 -- buffer.. 
--             else
--                 tablecache[str] = (tablecache[str] or 0) + 1
--                 buffer = buffer.."("..str..") {\n"
--                 for k, v in pairs(d) do
--                     buffer = buffer..string.rep(padder, depth+1).."["..k.."] => "
--                     _dumpvar(v, depth+1)
--                 end
--                 buffer = buffer..string.rep(padder, depth).."}\n"
--             end
--         elseif (t == "number") then
--             buffer = buffer.."("..t..") "..str.."\n"
--         else
--             buffer = buffer.."("..t..") \""..str.."\"\n"
--         end
--     end
--     _dumpvar(data, 0)
--     return buffer
-- end
-- function print_r(data)
--     print(dumpvar(data))
-- end

-- OS detection helpers
function isWindows()
    return vim.uv.os_uname().sysname:find("Windows", 1, true)
end
function isLinux()
    return vim.uv.os_uname().sysname:find("Linux", 1, true)
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

