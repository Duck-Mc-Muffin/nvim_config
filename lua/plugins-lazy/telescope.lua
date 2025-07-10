return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    opts = {
        defaults = {
            mappings = {
                n = { ['q'] = require('telescope.actions').close },
            },
            vimgrep_arguments = {
                'rg',
                '--color=never',
                '--no-heading',
                '--with-filename',
                '--line-number',
                '--column',
                '--smart-case',
            },
            layout_strategy = 'flex',
            layout_config = {
                flex = {
                    flip_columns = 140,
                },
                horizontal = {
                    preview_width = 0.6,
                    preview_cutoff = 0,
                },
            }
        },
        extensions = { fzf = {} }
    },
}
