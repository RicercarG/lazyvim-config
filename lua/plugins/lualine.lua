-- ~/.config/nvim/lua/plugins/lualine.lua

return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      -- This ensures a statusline is always shown for each window.
      laststatus = 2,
      -- The default LazyVim option is globalstatus = true.
      -- To show a statusline per window, this must be disabled.
      globalstatus = false,
    },
  },
}
