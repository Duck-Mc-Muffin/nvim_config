local dap = require('dap')

-- General
vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint)
vim.keymap.set('n', '<leader>gb', dap.run_to_cursor)

vim.keymap.set('n', '<F1>', dap.continue)
vim.keymap.set('n', '<F2>', dap.step_over)
vim.keymap.set('n', '<F3>', dap.step_into)
vim.keymap.set('n', '<F4>', dap.step_out)
vim.keymap.set('n', '<F5>', dap.step_back)
vim.keymap.set('n', '<F6>', dap.repl.open)

-- UI
local dapv = require('nvim-dap-virtual-text')
local ui = require('dapui')
dapv.setup()
ui.setup()

-- vim.keymap.set({'v', 'n'}, '<leader>?', function()
--     ui.eval(nil, { enter = true })
-- end)
vim.keymap.set('n', '<leader>?', function()
    dap.repl.open()
end)
vim.keymap.set('n', '<F9>', function()
    ui.close()
    vim.cmd(':DapVirtualTextForceRefresh')
end)

dap.listeners.before.attach.dapui_config = function() ui.open() end
dap.listeners.before.launch.dapui_config = function() ui.open() end
dap.listeners.before.event_terminated.dapui_config = function() ui.close() end
dap.listeners.before.event_exited.dapui_config = function() ui.close() end

-------------------------------------------------------------------------------------

-- Godot
dap.adapters.godot = {
  type = 'server',
  host = '127.0.0.1',
  port = 6006,
}
-- https://github.com/godotengine/godot-vscode-plugin#gdscript-debugger
dap.configurations.gdscript = {
  {
    type = "godot",
    request = "launch",
    name = "Launch Scene",
    project = "${workspaceFolder}",
    launch_scene = true,
  }
}
