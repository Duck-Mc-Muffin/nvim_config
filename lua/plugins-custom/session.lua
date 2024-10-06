local M = {}

M.setup = function()
    -- If inside a "project" with a personal directory, use that directory for session files instead
    local personal_dir  = GetPersonalDir()
    M.session_base_path = vim.fs.joinpath(vim.fn.stdpath('data'), 'custom_sessions') -- default directory
    if personal_dir ~= nil then
        M.session_base_path = vim.fs.joinpath(personal_dir, 'custom_sessions')
    end
    vim.fn.mkdir(M.session_base_path, "p")

    return true
end

M.getSessionFile = function()
    return vim.fs.joinpath(
        M.session_base_path,
        vim.fn.fnamemodify(vim.fn.getcwd(-1, -1), ":t") .. '.vim'
    )
end

M.create = function()
    vim.cmd('mks! ' .. M.getSessionFile())
end

M.load = function()
    if vim.fn.filereadable(M.getSessionFile()) < 1 then
        return
    end
    vim.cmd('source ' .. M.getSessionFile())
end

vim.api.nvim_create_autocmd('VimEnter', {
    group = vim.api.nvim_create_augroup('load_custom_session', {}),
    desc = 'Load a automatically created session when nvim is starting',
    pattern = '*',
    callback = M.load,
    nested = true,
})

vim.api.nvim_create_autocmd('VimLeave', {
    group = vim.api.nvim_create_augroup('save_custom_session', {}),
    desc = 'Save a session automatically when nvim is closed',
    pattern = '*',
    callback = M.create,
    nested = true,
})

vim.api.nvim_create_user_command('CustomSessionCreate', function(_) M.create() end, {})
vim.api.nvim_create_user_command('CustomSessionLoad', function(_) M.load() end, {})

return M