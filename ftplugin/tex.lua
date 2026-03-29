vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.expandtab = true

-- Only apply these to LaTeX files
vim.opt_local.wrap = true        -- Soft wrap long lines
vim.opt_local.linebreak = true   -- Don't break words in the middle
vim.opt_local.breakindent = true -- Wrapped lines retain the same indent
vim.opt_local.spell = true       -- Turn on spellcheck for your thesis
vim.opt_local.conceallevel = 2   -- Hide LaTeX code (like \textbf{}) for readability
vim.opt_local.textwidth = 0      -- Prevent hard-wrapping at a specific char limit

-- Optional: If you want a vertical line to see where the "standard" 80 char limit is
vim.opt_local.colorcolumn = "80"

vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

vim.keymap.set('i', '<Down>', '<C-o>gj')
vim.keymap.set('i', '<Up>', '<C-o>gk')

vim.keymap.set('n', 'A', 'g$i', { silent = true })
