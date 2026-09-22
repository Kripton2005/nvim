return {
  "stevearc/overseer.nvim",
  opts = {
    strategy = {
      "toggleterm",
    },
    task_list = {
      direction = "bottom",
      min_height = 5,
      max_height = 10,
      default_detail = 1,
    },
  },
  keys = {
    { "<leader>oo", "<cmd>OverseerRun<CR>",         desc = "Run Task" },
    { "<leader>ot", "<cmd>OverseerToggle<CR>",      desc = "Toggle Task List" },
    { "<leader>oi", "<cmd>OverseerInfo<CR>",        desc = "Overseer Info" },
    { "<leader>ob", "<cmd>OverseerBuild<CR>",       desc = "Select & Run Builder" },
    { "<leader>oa", "<cmd>OverseerQuickAction<CR>", desc = "Task Action (restart/dispose)" },
  },
}
