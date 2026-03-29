return {
  {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets', -- Optional: for code snippets
    version = '*', -- Use a release tag for stability

    ---@module 'blink.cmp'
    opts = {
      -- 'default' for 0.11+ looks, 'super-tab' for those used to VSCode/Tab
      keymap = {
        preset = 'super-tab' ,
        ['<Esc>'] = { 'hide', 'fallback' },
        -- ['<Tab>'] = { 'select_and_accept', 'snippet_forward', 'fallback' },
        ['<Up>'] = {'fallback'},
        ['<Down>'] = {'fallback'},
      },

      appearance = {
        use_nvim_cmp_as_default = true, -- Makes transition easier if you used cmp before
        nerd_font_variant = 'mono'
      },
      -- By removing 'snippets' from sources, you stop the blue Select Mode
      sources = {
        default = { 'lsp', 'path', 'buffer' },
      },
      -- 1. Keep the guide window enabled
      signature = {
        enabled = true,
        window = {
          border = 'rounded', -- options: 'single', 'double', 'rounded', 'solid'
        }
      },

      completion = {
        accept = {
          -- 2. Keep the empty brackets
          auto_brackets = { enabled = true },
        },
        -- 3. Show the guide as soon as you type the opening bracket
        trigger = { show_on_trigger_character = true },
      },

    },
    opts_extend = { "sources.default" }
  },
}
