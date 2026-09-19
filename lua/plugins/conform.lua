return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      cpp = { "clang-format" },
      c = { "clang-format" },
      cuda = { "clang-format" },
      rust = { "rustfmt" },
    },
    format_on_save = {
      timeout_ms = 3000, -- 3 seconds instead of 500ms
      lsp_format = "fallback",
      lsp_fallback = true,
    },
  },
}
