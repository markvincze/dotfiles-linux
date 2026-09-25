-- nvim-scrollbar
-- https://github.com/petertriho/nvim-scrollbar

vim.pack.add {
  { src = 'https://github.com/petertriho/nvim-scrollbar' },
  'https://github.com/kevinhwang91/nvim-hlslens',
  'https://github.com/lewis6991/gitsigns.nvim',
}
--
require('scrollbar').setup {}
