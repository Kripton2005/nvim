return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- Optional: for file icons
  },
  config = function()
    local function my_on_attach(bufnr)
      local api = require("nvim-tree.api")

      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- Default mappings
      api.config.mappings.default_on_attach(bufnr)

      -- Custom mappings: Swap d and D
      -- Now 'd' will trash, and 'D' will permanently delete
      vim.keymap.set('n', 'd', api.fs.trash, opts('Trash'))
      vim.keymap.set('n', 'D', api.fs.remove, opts('Delete'))
    end

    require("nvim-tree").setup({
      on_attach = my_on_attach,
      view = {
        width = 30,
        side = "left",
      },
      filters = {
        dotfiles = false, -- Show hidden files
        -- git_ignored = false, -- love hate relationship
      },
      git = {
        timeout = 1000, -- Increase this from 400 to 1000ms or higher
      },
      trash = {
        cmd = "trash-put",
      },
      actions = { open_file = { window_picker = { enable = false } } },
    })
    -- Shortcut to toggle the tree
    vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })
  end,
}
