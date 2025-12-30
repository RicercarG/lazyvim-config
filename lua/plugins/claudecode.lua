return {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  opts = {
    terminal = {
      split_width_percentage = 0.3,
    },
    -- Diff Integration
    diff_opts = {
      auto_close_on_accept = true,
      vertical_split = false,
      open_in_current_tab = false,
      keep_terminal_focus = false, -- If true, moves focus back to terminal after diff opens
    },
  },
}
