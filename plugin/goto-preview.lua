local preview = require("goto-preview")

preview.setup({
    border = {"┌", "─" ,"┐", "│", "┘", "─", "└", "│"},
})

vim.keymap.set("n", "gpd", preview.goto_preview_definition, {desc = "Open a preview window for 'go to definition.'"})
vim.keymap.set("n", "gpr", preview.goto_preview_references, {desc = "todo"})
vim.keymap.set("n", "gP", preview.close_all_win, {desc = "Close all preview windows."})

