return {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,    -- We want this loaded immediately
    priority = 1000, -- Load this before all other plugins
    config = function()
        -- 1. Setup the theme options (Modern themes have a setup call)
        require("rose-pine").setup({
            variant = "auto", -- auto, main, moon, or dawn
            dark_variant = "main", -- main, moon, or dawn
            extend_background_behind_borders = true,
            enable = {
                terminal = true,
                legacy_computing_symbols = false,
            },

            styles = {
                italic = true,
                bold = true,
                transparency = false,
            },
        })

        -- 2. Set the colorscheme using the modern Lua API
        vim.cmd.colorscheme("rose-pine")
    end
}
