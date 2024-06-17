-- local function dumpvar(data)
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

-- local function print_r(data)
--     print(dumpvar(data))
-- end

-- Opens <search_path>/<name>/general.lua or <search_path>/<name>.(lua|vim) or creates <search_path>/<name>.lua
local function open_file_in_tab(name, search_path)
    -- Search for general.lua in a FileType dir
    local file = vim.fs.find(
            {'general.lua', 'general.vim'},
            {
                type = 'file',
                path = vim.fs.joinpath(search_path, name)
            }
        )[1]
    if file ~= nil then
        vim.cmd('tab drop ' .. file)
        return
    end

    -- Search for a file for this FileType
    file = vim.fs.find(
            {name .. '.lua', name .. '.vim'},
            {
                type = 'file',
                path = search_path
            }
        )[1]
    if file ~= nil then
        vim.cmd('tab drop ' .. file)
        return
    end

    -- Create a new file for this FileType
    vim.cmd('tab drop ' .. vim.fs.joinpath(search_path, name) .. '.lua')
end

vim.keymap.set('n', '<leader>t', function()
    local ft = vim.bo.filetype
    local search_path = vim.fs.joinpath(vim.fn.stdpath('config'), 'ftplugin')
    open_file_in_tab(ft, search_path)
end, {desc = 'Open associated file type script for this file'})

vim.keymap.set('n', '<leader>n', function()
    local ft = vim.bo.filetype
    local search_path = vim.fs.joinpath(vim.fn.stdpath('config'), 'luasnip')
    open_file_in_tab(ft, search_path)
end, {desc = 'Open associated snippit script for this file type'})
