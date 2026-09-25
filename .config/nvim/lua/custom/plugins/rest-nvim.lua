-- rest-nvim
-- https://github.com/rest-nvim/rest.nvim

vim.pack.add {
  { src = 'https://github.com/rest-nvim/rest.nvim', version = vim.version.range '*' },
  'https://github.com/nvim-treesitter/nvim-treesitter',
}

vim.keymap.set('n', '<C-M-r>', ':Rest run<cr>', { desc = 'Run REST request' })
