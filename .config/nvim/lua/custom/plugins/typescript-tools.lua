-- typescript-tools
-- https://github.com/pmizio/typescript-tools.nvim

vim.pack.add {
  { src = 'https://github.com/pmizio/typescript-tools.nvim' },
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/neovim/nvim-lspconfig',
}

require("typescript-tools").setup {}
