return {
    "nvim-tree/nvim-tree.lua",
    --dependencies = {
    --   "nvim-tree/nvim-web-devicons"
    --},

    config = function()
        local nvimtree = require("nvim-tree")
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        -- set termguicolors to enable highlight groups
        vim.opt.termguicolors = true

        nvimtree.setup({
            sort = {
                sorter = "case_sensitive",
            },
            view = {
                width = 60,
                relativenumber = true,
            },
            renderer = {
                group_empty = true,
            },
            filters = {
                dotfiles = true,
            },
            actions = {
                open_file = {
                    quit_on_open = true,
                },
            },
            git = {
                enable = true,
                ignore = false,
                timeout = 500,
            },
        })

        vim.keymap.set("n", "<leader>pv", "<cmd>NvimTreeFindFileToggle<CR>")
        vim.keymap.set("n", "<leader>pc", "<cmd>NvimTreeCollapse<CR>")
        vim.keymap.set("n", "<leader>pr", "<cmd>NvimTreeRefresh<CR>")

    end,
}
