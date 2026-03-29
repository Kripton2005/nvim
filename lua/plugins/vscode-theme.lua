return {
  -- List all the themes you like so Lazy installs them
  { "folke/tokyonight.nvim" },
  { "catppuccin/nvim", name = "catppuccin" },

  -- The one you actually want to USE
  {
    "Mofiqul/vscode.nvim",
    lazy = false,    -- Make sure it loads on startup
    priority = 1000, -- Load this before everything else
    config = function()
      require('vscode').setup({ style = 'dark' })

      -- THIS is the only line in your whole config that should set the theme
      -- vim.cmd.colorscheme("vscode")
    end,
  },
}
