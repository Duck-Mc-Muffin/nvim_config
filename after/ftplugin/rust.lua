------ Action Ideas ------
-- Mapping: Toggle Option<_>, Result<_> or remove monad from a field

-- TODO: read from .toml
vim.opt_local.textwidth = 140

-- Auto format after leaving INSERT
vim.api.nvim_create_autocmd({ 'InsertLeave', 'BufWritePre' }, {
    desc = 'Formats the file after leaving -- INSERT --.',
    group = vim.api.nvim_create_augroup('format_file_after_insert', {}),
    buffer = 0,
    callback = function()
        vim.lsp.buf.format()
    end
})

-------------------------------- Treesitter powered mappings --------------------------------
local ts = vim.treesitter
local opts = { buffer = true, remap = false }

-- Paste current function parameters
local function paste_current_parameter_names()
    -- Get parent node
    local fn_node = FindParentFromCursor(function(node)
        return node:type() == 'function_item'
    end)
    if not fn_node then return end

    -- Define rust specific treesitter query
    local query_str = [[
        (parameter
          pattern: (identifier) @param_name)
    ]]

    -- Get parameter names
    local query = ts.query.parse('rust', query_str)
    local param_names = {}
    for _, node, _, _ in query:iter_captures(fn_node, 0) do
        table.insert(param_names, ts.get_node_text(node, 0))
    end

    -- Paste into buffer at cursor position
    vim.api.nvim_paste(table.concat(param_names, ', '), false, -1)
end
vim.keymap.set("n", "<leader>(", paste_current_parameter_names, opts)

-- Function text object
local function select_current_method()
    -- Get parent node
    local fn_node = FindParentFromCursor(function(node)
        return node:type() == 'function_item'
    end)
    if not fn_node then return end

    local start_row, start_col = fn_node:start()
    local end_row, end_col = fn_node:end_()

    vim.cmd('normal! V')
    vim.api.nvim_win_set_cursor(0, { start_row + 1, start_col })
    vim.cmd('normal! o')
    vim.api.nvim_win_set_cursor(0, { end_row + 1, end_col })
end
vim.keymap.set("o", "m", select_current_method, opts)
