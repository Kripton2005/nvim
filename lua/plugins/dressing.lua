return {
  "stevearc/dressing.nvim",
  opts = {
    select = {
      -- Tell dressing to route vim.ui.select to telescope
      backend = { "telescope", "builtin" },
      telescope = require("telescope.themes").get_dropdown({
        layout_config = {
          width = 0.4,
          height = 0.3,
        },
      }),
    },
  },
}
