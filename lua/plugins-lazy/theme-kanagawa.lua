return {
    'rebelot/kanagawa.nvim',
    config = function()
        -- require("kanagawa").setup({ transparent = true })

        -- Themes: wave, dragon, lotus
        vim.cmd("colorscheme kanagawa-wave")
    end,
}
