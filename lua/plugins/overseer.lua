return {
  "stevearc/overseer.nvim",
  opts = {
    task_list = {
      direction = "bottom",
      min_height = 5,
      max_height = 10,
      default_detail = 1,
    },
  },
  keys = {
    { "<leader>oo", "<cmd>OverseerRun<CR>",        desc = "Run Task" },
    { "<leader>ot", "<cmd>OverseerToggle<CR>",     desc = "Toggle Task List" },
    { "<leader>os", "<cmd>OverseerShell<CR>",      desc = "Overseer Shell" },
    { "<leader>oa", "<cmd>OverseerTaskAction<CR>", desc = "Overseer Task Action" },
  },
}
