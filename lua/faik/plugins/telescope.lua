return {
    "nvim-telescope/telescope.nvim", branch = '0.1.x',
    dependencies = { 
        'nvim-lua/plenary.nvim',
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local telescope = require("telescope")
        local builtin = require('telescope.builtin')

        -- this prevents freeze on big files (hopefully)
        telescope.setup( {
            defaults = {
                preview = {
                    filesize_hook = function(filepath, bufnr, opts)
                        local max_bytes = 10000
                        local cmd = {"head", "-c", max_bytes, filepath}
                        require('telescope.previewers.utils').job_maker(cmd, bufnr, opts)
                    end
                }
            }
        })

        telescope.load_extension("fzf")

        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})

    end
}
