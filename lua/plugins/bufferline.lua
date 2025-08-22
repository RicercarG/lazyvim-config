local bufferline = require("bufferline")
return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {
      options = {
        style_preset = bufferline.style_preset.minimal,
        themable = true,
        numbers = function(opts)
          return string.format("%s", opts.lower(opts.ordinal))
        end,
        indicator = {
          style = "underline",
        },
      },
    },
  },
}
