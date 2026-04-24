-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'f-person/git-blame.nvim',
    -- load the plugin at startup
    event = 'VeryLazy',
    -- Because of the keys part, you will be lazy loading this plugin.
    -- The plugin will only load once one of the keys is used.
    -- If you want to load the plugin at startup, add something like event = "VeryLazy",
    -- or lazy = false. One of both options will work.
    opts = {
      -- your configuration comes here
      -- for example
      enabled = false, -- if you want to enable the plugin
      message_template = ' <summary> • <date> • <author> • <<sha>>', -- template for the blame message, check the Message template section for more options
      date_format = '%m-%d-%Y %H:%M:%S', -- template for the date, check Date format section for more options
      virtual_text_column = 1, -- virtual text start column, check Start virtual text at column section for more options
    },
  },
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
      open_mapping = '<C-t>',
    },
  },
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
  },
  {
    'petertriho/nvim-scrollbar',
    dependencies = { 'kevinhwang91/nvim-hlslens', 'lewis6991/gitsigns.nvim' },
    opts = {},
  },
  {
    'restclient.nvim',
    dir = '~/Workspaces/GitHub/markvincze/restclient.nvim',
    config = function() require('restclient').setup {} end,
  },
  {
    'jinzhongjia/zig-lamp',
    event = 'VeryLazy',
    -- Optional but recommended: build the local FFI lib to enable faster/safer verification & formatting
    build = ':ZigLampBuild async',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- For Neovim < 0.11 you’ll likely want lspconfig
      'neovim/nvim-lspconfig',
    },
    init = function()
      -- Backward-compatible global vars (all optional)
      -- Auto-install ZLS: timeout in milliseconds; set to nil to disable
      vim.g.zig_lamp_zls_auto_install = nil
      -- Fallback to system zls when no local match is found
      vim.g.zig_lamp_fall_back_sys_zls = nil
      -- Extra LSP options merged into defaults
      vim.g.zig_lamp_zls_lsp_opt = {}
      -- ZLS server settings (overrides built-in recommendations)
      vim.g.zig_lamp_zls_settings = {}
      -- Help text color for the package panel
      vim.g.zig_lamp_pkg_help_fg = '#CF5C00'
      -- Timeout (ms) used by `zig fetch` when retrieving url hashes
      vim.g.zig_lamp_zig_fetch_timeout = 5000
    end,
  },
  {
    'selimacerbas/markdown-preview.nvim',
    dependencies = { 'selimacerbas/live-server.nvim' },
    config = function()
      require('markdown_preview').setup {
        -- all optional; sane defaults shown
        instance_mode = 'takeover', -- "takeover" (one tab) or "multi" (tab per instance)
        port = 0, -- 0 = auto (8421 for takeover, OS-assigned for multi)
        open_browser = true,
        debounce_ms = 300,
      }
    end,
  },
}
