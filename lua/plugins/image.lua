return {
  "3rd/image.nvim",
  opts = {
    backend = "kitty",               -- or "ueberzug" if using a different terminal
    integrations = {
      markdown = { enabled = true }, -- Automatically show images in Markdown files
      pdf = {
        enabled = true,
        render_all_pages = false, -- Recommended for performance
        edit_mode = false,
      },
    },
    max_width = 100,
    max_height = 12,
    window_overlap_clear_enabled = true,
  },
}
