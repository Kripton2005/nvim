vim.keymap.set('n', '<CR>', 'm`o<Esc>``', { desc = 'Insert newline below' })

-- Use Esc to exit terminal mode
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- Remaps for easier window switching
vim.keymap.set('n', '<A-h>', '<C-w>h')
vim.keymap.set('n', '<A-j>', '<C-w>j')
vim.keymap.set('n', '<A-k>', '<C-w>k')
vim.keymap.set('n', '<A-l>', '<C-w>l')

-- Resize windows with Ctrl + Arrow keys
vim.keymap.set('n', '<A-Up>', ':resize +2<CR>', { desc = "Increase window height" })
vim.keymap.set('n', '<A-Down>', ':resize -2<CR>', { desc = "Decrease window height" })
vim.keymap.set('n', '<A-Left>', ':vertical resize -2<CR>', { desc = "Decrease window width" })
vim.keymap.set('n', '<A-Right>', ':vertical resize +2<CR>', { desc = "Increase window width" })

-- 'v' for Vertical, 'h' for Horizontal
vim.keymap.set("n", "<leader>v", ":vsplit<CR>", { desc = "Vertical Split" })
vim.keymap.set("n", "<leader>h", ":split<CR>", { desc = "Horizontal Split" })

-- Move selected line / block of text in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move block down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move block up" })

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "<leader>sw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>t", ":botright vsplit | term<CR>i", { desc = "Terminal in right split" })

-- Stay in visual mode after indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Show diagnostic message in a floating window
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show line diagnostic" })

local function smart_gd()
  vim.lsp.buf.definition({
    on_list = function(options)
      if #options.items > 1 then
        -- Multiple hits (.h and .c): open quickfix
        vim.fn.setqflist({}, " ", options)
        vim.api.nvim_command("copen")
      elseif #options.items == 1 then
        -- Single hit: use the NEW show_document API
        local item = options.items[1]
        vim.lsp.util.show_document(item.user_data, "utf-16", { focus = true })
      end
    end,
  })
end

vim.keymap.set("n", "gd", smart_gd, { desc = "Modern Go-to-Definition" })

-- Add this to your remaps or on_attach
vim.keymap.set('n', 'K', function()
  vim.lsp.buf.hover({ border = "rounded" })
end, { desc = "LSP Hover with Border" })
