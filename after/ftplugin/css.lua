-------------------------------- Treesitter powered mappings --------------------------------
local ts = vim.treesitter
local opts = { buffer = true, remap = false }

-- Function text object
local function select_current_method()
    -- Get parent node
    local fn_node = FindParentFromCursor(function(node)
        return node:type() == 'rule_set'
    end)
    if not fn_node then return end

    local start_row, start_col = fn_node:start()
    local end_row, end_col = fn_node:end_()

    vim.cmd('normal! V')
    vim.api.nvim_win_set_cursor(0, { start_row + 1, start_col })
    vim.cmd('normal! o')
    vim.api.nvim_win_set_cursor(0, { end_row + 1, end_col })
end
vim.keymap.set('o', 'm', select_current_method, opts)

local function toggle_ruleset_formatting()
    local fn_node = FindParentFromCursor(function(node)
        return node:type() == 'rule_set'
    end)
    if not fn_node then return end

    local start_row, start_col = fn_node:start()
    local end_row, end_col = fn_node:end_()
    local row_count = end_row - start_row

    if row_count <= 1 then
        vim.cmd('s/{\\s\\+/{\r/ge')
        vim.cmd('s/\\s\\+}/\r}/ge')
        vim.cmd('normal! k')
        vim.cmd('s/;\\s\\+/;\r/ge')
        vim.cmd('normal! va{=')
    else
        for i=0, row_count - 1, 1 do
            vim.cmd('normal! J')
        end
    end

    vim.api.nvim_win_set_cursor(0, { start_row + 1, start_col })
end
vim.keymap.set('n', '<leader>t', toggle_ruleset_formatting, opts)
