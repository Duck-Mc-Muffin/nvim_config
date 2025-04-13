local lspconfig = require('lspconfig')

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function (event)
        local opts = {buffer = event.buf, remap = false}
        local client = vim.lsp.get_client_by_id(event.data.client_id)

        -- Custom Go-Definition: either jump to definition or jump from definition to the first reference
        vim.keymap.set("n", "gd", function ()
            local current_file = event.file
            local current_line = vim.api.nvim_win_get_cursor(0)[1]
            vim.lsp.buf.definition({ on_list = function(def_options)
                local function on_list_custom(ref_options)
                    ---@diagnostic disable-next-line: param-type-mismatch
                    vim.fn.setqflist({}, ' ', ref_options)
                    vim.cmd.cfirst()
                end
                local item = def_options.items[1]
                if current_file ~= item.filename or current_line ~= item.lnum then
                    vim.lsp.buf.definition({ on_list = on_list_custom })
                else
                    vim.lsp.buf.references(nil, { on_list = on_list_custom })
                end
            end })
        end, opts)

        -- Keymaps
        vim.keymap.set("n", "g=", vim.lsp.buf.format, opts)
        vim.keymap.set("n", "gws", vim.lsp.buf.workspace_symbol, opts)
        vim.keymap.set("n", "grd", vim.lsp.buf.declaration, opts)

        -- Telescope Keymaps
        vim.keymap.set("n", "<leader>ws", function()
            require('telescope.builtin').lsp_document_symbols({
                initial_mode = "normal",
                sorting_strategy = "ascending",
                layout_config = { height = 0.4, preview_width = 0.7 }
            })
        end, opts)
        vim.keymap.set("n", "<leader>wS", function()
            require('telescope.builtin').lsp_workspace_symbols()
        end, opts)
        vim.keymap.set("n", "<leader>rr", function()
            require('telescope.builtin').lsp_references({ initial_mode = "normal", layout_strategy = 'vertical' })
        end, opts)

        -- Highlight word under the cursor
        if client ~= nil and client:supports_method('textDocument/documentHighlight') then
            vim.opt_local.updatetime = 300
            vim.api.nvim_create_autocmd({'CursorHold', 'CursorHoldI'}, {
                desc = 'Highlights the current variable under the cursor.',
                group = vim.api.nvim_create_augroup('highlight_cursor_word', {}),
                callback = function (_)
                    vim.lsp.buf.clear_references()
                    vim.lsp.buf.document_highlight()
                end,
            })
            vim.api.nvim_create_autocmd('CursorMoved', {
                desc = 'Highlights the current variable under the cursor.',
                group = vim.api.nvim_create_augroup('unhighlight_cursor_word', {}),
                callback = function (_)
                    vim.lsp.buf.clear_references()
                end,
            })
        end
    end
})

----------------------------------------------- Languages -----------------------------------------------
-- PHP (Laravel)
lspconfig.html.setup({ filetypes = {'html', 'templ'--[[, 'blade'--]]} })
lspconfig.intelephense.setup({
    filetypes = {'php'--[[, 'blade'--]]},
    root_dir = function () return vim.fn.getcwd() end
})

-- -- INSTALL GLSL: https://github.com/nolanderc/glsl_analyzer/releases
-- lspconfig.glsl_analyzer.setup({})

-- This is not needed for godot if --> see 'after/ftplugin/gdscript.lua'
lspconfig.gdscript.setup({})
