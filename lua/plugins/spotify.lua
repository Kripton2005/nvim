return {
  "stsewd/spotify.nvim",
  build = ":UpdateRemotePlugins",
  config = function()
    require("spotify").setup({
      notification = {
        extra_opts = {
          icon = "",
        },
        width = 34,
        progressbar = {
          width = 30,
        }
      },
    })
  end,
  init = function()
    -- Optional mappings.
    vim.keymap.set("n", "<leader>ss", ":Spotify play/pause<CR>", { silent = true })
    vim.keymap.set("n", "<leader>sn", ":Spotify next<CR>", { silent = true })
    vim.keymap.set("n", "<leader>sp", ":Spotify prev<CR>", { silent = true })
    vim.keymap.set("n", "<leader>sh", ":Spotify show<CR>", { silent = true })
    vim.keymap.set("n", "<leader>st", ":Spotify status<CR>", { silent = true })
  end,
}
