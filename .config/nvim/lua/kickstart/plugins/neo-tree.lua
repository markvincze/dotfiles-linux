-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
    { '<C-n>', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    filesystem = {
      filtered_items = {
        visible = true, -- when true, they will just be displayed differently than normal items
        -- hide_dotfiles = true,
        -- hide_gitignored = true,
        -- hide_ignored = true, -- hide files that are ignored by other gitignore-like files
      },
      window = {
        width = 20,
        auto_expand_width = false,
        mappings = {
          ['\\'] = 'close_window',
          ['/'] = 'none',
        },
      },
    },
  },
}
