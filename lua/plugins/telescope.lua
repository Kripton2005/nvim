return {
  'nvim-telescope/telescope.nvim',
  tag = 'v0.2.0',
  dependencies = { 'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-live-grep-args.nvim',
  },
  config = function()
    require('telescope').setup({
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--trim" -- Add this flag here
        },
      }
    })

    local builtin = require('telescope.builtin')

    -- vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>pf', function()
      builtin.find_files({ no_ignore = true, hidden = true })
    end, { desc = 'Telescope find all files' })

    vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Telescope find git tracked files' })

    vim.keymap.set('n', '<leader>pg', ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
      { desc = 'Telescope live grep (with args)' })
    vim.keymap.set('n', '<leader>bg', builtin.current_buffer_fuzzy_find, { desc = 'Buffer grep (fuzzy)' })

    -- Grep All: Includes hidden and ignored files (Use this for fs.img / compile_commands)
    vim.keymap.set('n', '<leader>pa', function()
      builtin.live_grep({
        additional_args = function()
          return { "--no-ignore", "--hidden", "--glob", "!**/.git/*" }
        end
      })
    end, { desc = 'Live Grep All (Including Ignored)' })

    -- Grep the word under the cursor
    vim.keymap.set('n', '<leader>wg', builtin.grep_string, { desc = 'Grep word under cursor' })
  end
}
