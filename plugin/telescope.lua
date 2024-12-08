local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "Telescope find files"})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {desc = "Telescope find with live grep (cooler)"})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = "Telescope find in buffers"})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = "Telescope find help tags"})
vim.keymap.set('n', '<leader>fm', builtin.marks, {desc = "Telescope find marks"})
vim.keymap.set('n', '<leader>fs', builtin.git_status, {desc = "Telescope find git hunks"})
vim.keymap.set('n', '<C-p>', builtin.git_files, {desc = "Telescope find in git files"})

vim.keymap.set('n', '<leader>fd', function()
    builtin.diagnostics({ initial_mode = "normal" })
end, {desc = "Telescope find diagnostics"})

vim.keymap.set('n', '<leader>fvg', function()
    builtin.grep_string({search = vim.fn.input("Grep > ")})
end, {desc = "Telescope find vim search and grep_string"})

vim.keymap.set('n', '<leader>fr', function()
    builtin.resume({ initial_mode = "normal" })
end, {desc = "Telescope open up last search"})

-- Mappings in Telescope window:
--
-- <C-n>/<Down> Next item
-- <C-p>/<Up>   Previous item
-- H/M/L   Select High/Middle/Low (in normal mode)
-- gg/G    Select the first/last item (in normal mode)
-- <CR>    Confirm selection
-- <C-x>   Go to file selection as a split
-- <C-v>   Go to file selection as a vsplit
-- <C-t>   Go to a file in a new tab
-- <C-u>   Scroll up in preview window
-- <C-d>   Scroll down in preview window
-- <C-f>   Scroll left in preview window
-- <C-k>   Scroll right in preview window
-- <M-f>   Scroll left in results window
-- <M-k>   Scroll right in results window
-- <C-/>   Show mappings for picker actions (insert mode)
-- ?       Show mappings for picker actions (normal mode)
-- <C-c>   Close telescope (insert mode)
-- <Esc>   Close telescope (in normal mode)
-- <Tab>   Toggle selection and move to next selection
-- <S-Tab> Toggle selection and move to prev selection
-- <C-q>   Send all items not filtered to quickfixlist (qflist)
-- <M-q>   Send all selected items to qflist
