return {
  {
    "folke/sidekick.nvim",
    opts = {
      -- Keep Sidekick as an AI CLI terminal only. This also prevents the
      -- LazyVim Sidekick extra from enabling the Copilot LSP for NES.
      nes = { enabled = false },
      cli = {
        win = {
          split = {
            width = 0.35,
          },
        },
      },
    },
    keys = {
      -- The LazyVim extra adds this for NES. Disable it since NES is off.
      { "<tab>", false, mode = { "n" } },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        copilot = { enabled = false },
      },
    },
  },
}
