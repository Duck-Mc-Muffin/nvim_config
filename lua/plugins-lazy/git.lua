return {
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
            "nvim-telescope/telescope.nvim",
        },
        config = true,
        event = "VeryLazy",
    },
    {
        "lewis6991/gitsigns.nvim",
    },
}
