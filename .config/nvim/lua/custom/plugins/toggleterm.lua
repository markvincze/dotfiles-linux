-- toggleterm
-- https://github.com/akinsho/toggleterm.nvim

vim.pack.add {
  {
    src = 'https://github.com/akinsho/toggleterm.nvim',
  },
}

require('toggleterm').setup {
  -- open_mapping = [[<c-\>]],
  open_mapping = [[<M-t>]],
}
