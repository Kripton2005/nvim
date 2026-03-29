return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    notifier = {
      timeout = 5000,
      -- width = { min = 30, max = 0.4 }, -- Keeps it small by default
      top_down = false,  -- Stack from the bottom up (optional)
    },
  },
}
