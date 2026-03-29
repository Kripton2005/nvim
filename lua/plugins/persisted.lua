return {
  "olimorris/persisted.nvim",
  lazy = false, -- Must be false so it can manage the session on startup
  priority = 1000,
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
    local persisted = require("persisted")

    persisted.setup({
      autostart = true, -- Automatically start session tracking
      autosave = true, -- Save session when exiting Neovim
      autoload = false, -- We use Telescope to load sessions manually
      use_git_branch = true, -- Separate sessions by git branch
      save_dir = vim.fn.expand(vim.fn.stdpath("data") .. "/sessions/"),
      options = {
        "buffers",
        "curdir",
        "tabpages",
        "winsize",
        "terminal", -- Ensures terminal windows stay in the layout
      },
    })

    -- 1. Ensure the session starts even if Neovim is shy
    vim.api.nvim_create_autocmd("VimEnter", {
      group = vim.api.nvim_create_augroup("PersistedForceStart", { clear = true }),
      callback = function()
        if not vim.g.persisting then
          persisted.start()
        end
      end,
    })

    -- 2. Close NvimTree before saving to prevent ghost layout buffers
    vim.api.nvim_create_autocmd("User", {
      pattern = "PersistedSavePre",
      callback = function()
        pcall(function()
          vim.cmd("NvimTreeClose")
        end)
      end,
    })

    -- 3. Force NvimTree to load and open after the session is restored
    vim.api.nvim_create_autocmd("User", {
      pattern = "PersistedLoadPost",
      callback = function()
        -- Ensure we aren't stuck on a 'No Name' buffer
        if vim.bo.filetype == "" or vim.bo.filetype == "startup" then
          vim.cmd("bn") -- Go to the next real buffer
        end
        -- Re-open the tree as we did before
        pcall(function() vim.cmd("NvimTreeOpen") end)
      end,
    })

    -- Load the extension into telescope
    require("telescope").load_extension("persisted")
  end,
  keys = {
    { "<leader>qs", "<cmd>Telescope persisted<cr>", desc = "Search Sessions" },
    { "<leader>qc", "<cmd>PersistedClose<cr>", desc = "Close Session" },
  },
}
