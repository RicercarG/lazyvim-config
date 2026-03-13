return {
  "folke/snacks.nvim",
  opts = {
    image = {
      enabled = true,
    },
    scroll = {
      enabled = false,
    },
    picker = {
      sources = {
        explorer = {
          hidden = true,
          ignored = true,
          layout = {
            layout = {
              width = 30,
            },
          },
        },
      },
    },
    explorer = {
      trash = false,
    },
  },
}
