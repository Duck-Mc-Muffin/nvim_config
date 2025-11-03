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

vim.keymap.set('n', '<leader>ft', function()
    local conf_path   = vim.fn.stdpath('config')
    local ft          = vim.bo.filetype
    local search_path = vim.fs.joinpath(conf_path, 'after/ftplugin')
    open_file_in_tab(ft, search_path)
    vim.cmd('tcd ' .. conf_path)
end, {desc = 'Open associated file type script for this file'})

vim.keymap.set('n', '<leader>ni', function()
    local conf_path   = vim.fn.stdpath('config')
    local ft          = vim.bo.filetype
    local search_path = vim.fs.joinpath(conf_path, 'luasnip')
    open_file_in_tab(ft, search_path)
    vim.cmd('tcd ' .. conf_path)
end, {desc = 'Open associated snippit script for this file type'})

-- Open current file with OS standard app
if isWindows() then
    vim.keymap.set('n', '<leader>o', function()
        os.execute("start " .. vim.fn.expand("%"))
    end, {desc = 'Open current file with associated OS standard app'})
elseif isLinux() then
    vim.keymap.set('n', '<leader>o', function()
        os.execute("xdg-open " .. vim.fn.expand("%"))
    end, {desc = 'Open current file with associated OS standard app'})
end

