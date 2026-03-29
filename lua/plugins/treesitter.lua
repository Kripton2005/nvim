return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter")

    ts.setup({
      ensure_installed = { "c", "cpp", "haskell", "sql", "lua", "help", "query", "rust", "python", "latex", "bibtex" },

      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    })
  end
}
