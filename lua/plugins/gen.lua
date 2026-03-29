return {
  "David-Kunz/gen.nvim",
  opts = {
    model = "qwen2.5-coder:latest",
    display_mode = "float",
    show_model = true,
    no_auto_close = false,
  },

  config = function(_, opts)
    require("gen").setup(opts)

    -- Define the new automated prompt
    require('gen').prompts['Review_Text'] = {
      prompt = "Regarding the following text:\n$text\n\n" ..
          "Is there anything technically wrong? " ..
          "Are there spelling mistakes? " ..
          "Are there potential ambiguities and improvements? ",
      replace = false, -- Keep the original text, just show the response
    }

    -- Keymap: Use 'require("gen").select_model' or call the prompt directly
    -- We use <Esc> to exit visual mode so the selection is properly captured
    vim.keymap.set('v', '<leader>a', ':Gen Review_Text<CR>', { silent = true })
    vim.keymap.set('v', '<leader>b', ':Gen Ask<CR>', { silent = true })
  end,
}
