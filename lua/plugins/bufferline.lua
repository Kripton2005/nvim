return {
  "akinsho/bufferline.nvim",
  version = "*",
  lazy = false,   -- This makes it load on startup instead of waiting for a keypress
  priority = 900, -- Ensures it loads before other UI elements
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers", -- Displays open files as tabs
        separator_style = "thin",
        -- This offset prevents tabs from overlapping Nvim-Tree
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "left",
            separator = true,
          },
        },
        -- Optional: improves clarity when multiple buffers have the same name
        diagnostics = "nvim_lsp",
        -- close_icon = '',
        show_close_icon = false,
        show_buffer_close_icons = false,
        custom_filter = function(buf_number)
          if vim.bo[buf_number].filetype == "" and vim.fn.bufname(buf_number) == "" then
            return false
          end
          if vim.fn.isdirectory(vim.fn.bufname(buf_number)) == 1 then
            return false
          end
          return true
        end,
        sort_by = function(buffer_a, buffer_b)
          return buffer_a.id > buffer_b.id
        end,
        ---@diagnostic disable-next-line: unused-local
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local s = " "
          for e, n in pairs(diagnostics_dict) do
            local sym = e == "error" and " "
                or (e == "warning" and " " or " ")
            s = s .. n .. sym
          end
          return s
        end
      },
      highlights = {
        fill = { bg = "#16161e" },

        -- background = { bg = "#16161e", fg = "#565f89" },
        -- buffer_selected = { bg = "#1f2335", fg = "#c0caf5", bold = true },

        -- separator = { bg = "#16161e", fg = "#3b4261" },
        -- separator_selected = { bg = "#1f2335", fg = "#3b4261" },

        -- error = { fg = "#db4b4b", bg = "#1f2335" },
        -- error_diagnostic = { fg = "#db4b4b", bg = "#1f2335" },

        -- error_selected = { fg = "#db4b4b", bg = "#3b4261", bold = true },
        -- error_diagnostic_selected = { fg = "#db4b4b", bg = "#3b4261", bold = true },
      },

    })
    -- Global Keymaps (These work even if your cursor is in Nvim-Tree)
    local map = vim.keymap.set

    -- Use Shift+H and Shift+L to navigate tabs
    map("n", "L", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Tab" })
    map("n", "H", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Tab" })

    -- Move tabs left/right
    map("n", "<leader>bl", "<cmd>BufferLineMoveNext<cr>", { desc = "Move Tab Right" })
    map("n", "<leader>bh", "<cmd>BufferLineMovePrev<cr>", { desc = "Move Tab Left" })

    -- Close current tab safely (bp|bd # keeps your split window open)
    map("n", "<leader>c", "<cmd>bp|bd #<cr>", { desc = "Close Tab, Keep Split" })
  end,
}
