-- snacks.nvim
-- https://github.com/folke/snacks.nvim

vim.pack.add {
  { src = 'https://github.com/folke/snacks.nvim' },
  'https://github.com/nvim-mini/mini.icons',
  'https://github.com/nvim-tree/nvim-web-devicons',
}

require('snacks').setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
  bigfile = { enabled = false },
  dashboard = { enabled = false },
  explorer = { enabled = false },
  indent = { enabled = true },
  image = { enabled = true },
  dim = { enabled = false },
  input = { enabled = true },
  picker = { enabled = false },
  notifier = { enabled = true },
  quickfile = { enabled = false },
  scope = { enabled = false },
  scroll = { enabled = false },
  statuscolumn = { enabled = false },
  words = { enabled = false },
}
