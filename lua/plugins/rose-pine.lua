local hour = tonumber(os.date("%H"))
local day_theme = "rose-pine-dawn"
local night_theme = "rose-pine-moon"

return {
  -- configure rose-pine theme
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        variant = "dawn",
        groups = {
          border = "gold",
        },
      })
      -- vim.cmd("colorscheme rose-pine-dawn")
    end,
  },

  -- auto switch light and dark based on time
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = hour >= 7 and hour < 19 and day_theme or night_theme,
    },
  },
}
