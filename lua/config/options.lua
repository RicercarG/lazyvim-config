-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- HARD REQUIRE source builds (no prebuilt binaries)
vim.env.TREE_SITTER_INSTALL_FROM_SOURCE = "1"
-- ensure system compiler is used
vim.env.CC = "gcc"

-- Enable auto-save
vim.opt.autowrite = true
vim.opt.autowriteall = true
