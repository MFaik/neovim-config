return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("nvim-treesitter").setup({
            ensure_installed = {
                "lua", "vim", "vimdoc",
                "dart", "rust",
                "html", "css", "javascript",
                "json", "yaml", "toml",
                "markdown", "markdown_inline",
            },
            auto_install = true,
            highlight = {
                enable = true,
                disable = function(lang, buf)
                    local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > 100 * 1024 then
                        return true
                    end
                end,
            },
            indent = { enable = true },
        })
    end,
}
