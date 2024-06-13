local lsp_zero   = require('lsp-zero')
local lsp_config = require('lspconfig')

lsp_zero.on_attach(function(client, bufnr)
    -- Keymaps
    local opts = {buffer = bufnr, remap = false}
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "<leader>vn", function() vim.diagnostic.jump({count = 1, float = true}) end, opts)
    vim.keymap.set("n", "<leader>vN", function() vim.diagnostic.jump({count = -1, float = true}) end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrq", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() require('telescope.builtin').lsp_references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

    -- Highlight word under the cursor
    vim.o.updatetime = 300
    vim.api.nvim_create_autocmd('CursorHold', {
        desc = 'Highlights the current variable under the cursor.',
        group = vim.api.nvim_create_augroup('highlight_cursor_word', {}),
        callback = function (opts)
            vim.lsp.buf.clear_references()
            vim.lsp.buf.document_highlight()
        end,
    })
    vim.api.nvim_create_autocmd('CursorMoved', {
        desc = 'Highlights the current variable under the cursor.',
        group = vim.api.nvim_create_augroup('unhighlight_cursor_word', {}),
        callback = function (opts)
            vim.lsp.buf.clear_references()
        end,
    })
end)
