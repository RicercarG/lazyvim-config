return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      -- This ensures a statusline is always shown for each window.
      laststatus = 2,
      -- The default LazyVim option is globalstatus = true.
      -- To show a statusline per window, this must be disabled.
      globalstatus = false,
      component_separators = "",
      section_separators = { left = "", right = "" },
    },
    sections = {
      lualine_y = {
        { "progress" },
      },
      lualine_z = {
        { "location", padding = { left = 0, right = 1 } },
      },
    },
  },
}
