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
  {
    'andev0x/sql-formatter.nvim',
    ft = { 'sql', 'mysql', 'plsql', 'pgsql' },
    opts = {
      indent = '    ',
      tab_width = 4,
    },
    config = function()
      -- vim.g.sqlformat_command = 'sqlformat'
      -- vim.g.sqlformat_options = '-r -k upper'
      -- vim.g.sqlformat_prog = 'sqlformat'
      require('sql-formatter').setup {
        format_on_save = false,
        dialect = 'postgresql',
        indent = '    ',
        tab_width = 4,
        external_formatter = {
          enabled = true,
          -- Use sql-formatter (Node.js):
          command = 'sql-formatter',
          args = { '--config', '\'{ "tabWidth": 4 }\'' },
        },
      }
    end,
  },
  {
    'mistweaverco/kulala.nvim',
    -- Load before session save/restore so VimLeavePre and SessionLoadPost hooks are registered.
    event = { 'SessionLoadPost', 'VimLeavePre' },
    keys = {
      { '<leader>Rs', desc = 'Send request' },
      { '<leader>Ra', desc = 'Send all requests' },
      { '<leader>Rb', desc = 'Open scratchpad' },
    },
    -- See opts.lsp.enforce_external_script_naming_convention
    -- to restrict LSP capabilities to *.http, *.http.js, *.http.ts and *.http.lua files.
    ft = { 'http', 'rest', 'javascript', 'lua' },
    opts = {
      kulala_core = {
        -- Optional path to the kulala-core executable
        -- (https://github.com/mistweaverco/kulala-core).
        -- When set, this path is used exclusively.
        -- When nil (default), auto-download and
        -- use kulala-core from GitHub releases based on the user's OS and architecture.
        path = nil,
        -- Subprocess timeout (ms) for kulala-core.
        -- Default is 60000 (1 minute).
        -- nil disables the vim.system timeout.
        timeout = 60000,
        -- Optional override for kulala-core persistence
        -- (cookies, OAuth, prompts).
        -- Default matches kulala-core CLI:
        -- - Linux: ~/.local/share/kulala-core
        --   or $XDG_DATA_HOME/kulala-core
        -- - macOS: ~/Library/Application
        --   or Support/kulala-core
        -- - Windows: %APPDATA%\kulala-core
        data_dir = nil,
        -- Optional override for download url
        download_url = 'https://github.com/mistweaverco/kulala-core/releases/download/%s/%s',
      },
      -- Restore request history and UI after sourcing a vim session.
      -- Requires `set sessionoptions+=globals` in your Neovim config.
      session = {
        restore = true,
      },
      -- dev, test, prod, can be anything
      -- see: https://learn.microsoft.com/en-us/aspnet/core/test/http-files?view=aspnetcore-8.0#environment-files
      default_env = 'default',
      -- `"b"` = per-buffer env (default), `"g"` = global
      environment_scope = 'b',
      -- enable reading vscode rest client environment variables
      vscode_rest_client_environmentvars = false,

      -- Response body pretty-printing
      response_format = {
        indent = 2,
        expand_tabs = true,
        sort_keys = false,
      },
      ui = {
        -- display mode: possible values: "split", "float"
        display_mode = 'split',
        -- split direction: possible values: "above", "right", "below", "left", fun(): "above"|"right"|"below"|"left"
        split_direction = 'right',
        -- window options to override win_config: width/height/split/vertical.., buffer/window options
        win_opts = { bo = {}, wo = { foldmethod = 'manual' } }, ---@type kulala.ui.win_config
        -- default view: "body" or "headers" or "headers_body" or "verbose" or fun(response: Response)
        default_view = 'body', ---@type "body"|"headers"|"headers_body"|"verbose"|fun(response: Response)
        -- enable winbar
        winbar = true,
        -- Specify the panes to be displayed by default
        -- Available panes are { "body", "headers", "headers_body", "script_output", "stats", "verbose", "report", "help" },
        default_winbar_panes = { 'body', 'headers', 'verbose', 'script_output', 'report' },
        -- Winbar labels
        winbar_labels = {
          body = 'Body',
          headers = 'Headers',
          headers_body = 'All',
          verbose = 'Verbose',
          script_output = 'Script Output',
          stats = 'Stats',
          report = 'Report',
          help = 'Help',
        },
        -- show/hide winbar keymaps in labels
        winbar_labels_keymaps = true,
        -- enable/disable variable info text
        -- this will show the variable name and value as float
        -- possible values: false, "float"
        show_variable_info_text = false,
        -- icons position: "signcolumn"|"on_request"|"above_request"|"below_request" or nil to disable
        show_icons = 'on_request',
        -- default icons
        icons = {
          inlay = {
            loading = '⏳',
            done = '✔',
            error = '✘',
          },
          lualine = '🐼',
          textHighlight = 'WarningMsg', -- highlight group for request elapsed time
          loadingHighlight = 'Normal',
          doneHighlight = 'String',
          errorHighlight = 'ErrorMsg',
        },

        -- enable/disable request summary in the output window
        show_request_summary = true,

        -- do not show responses over maximum size, in bytes
        max_response_size = 32768,

        -- used by `Copy as Curl` command to determine whether to inline request body
        max_request_size = 2048,

        report = {
          -- possible values: true | false | "on_error"
          show_script_output = true,
          -- possible values: true | false | "on_error" | "failed_only"
          show_asserts_output = true,
          -- possible values: true | false | "on_error"
          show_summary = true,

          headersHighlight = 'Special',
          successHighlight = 'String',
          errorHighlight = 'Error',
        },

        -- scratchpad default contents
        scratchpad_default_contents = {
          '@MY_TOKEN_NAME=my_token_value',
          '',
          '# @name scratchpad',
          'POST https://echo.kulala.app/post HTTP/1.1',
          'accept: application/json',
          'content-type: application/json',
          '',
          '{',
          '  "foo": "bar"',
          '}',
        },

        -- Settings for pickers used for Environment, Authentication and Requests Managers
        pickers = {
          snacks = {
            layout = function()
              local has_snacks, snacks_picker = pcall(require, 'snacks.picker')
              return not has_snacks and {}
                or vim.tbl_deep_extend('force', snacks_picker.config.layout 'telescope', {
                  reverse = true,
                  layout = {
                    { { win = 'list' }, { height = 1, win = 'input' }, box = 'vertical' },
                    { win = 'preview', width = 0.6 },
                    box = 'horizontal',
                    width = 0.8,
                  },
                })
            end,
          },
        },
      },

      lsp = {
        ---enable/disable built-in LSP server
        ---@type boolean
        enable = true,

        ---filetypes to attach Kulala LSP to
        ---@type string[]
        filetypes = {
          'http',
          'rest',
          'javascript',
          'typescript',
          'lua',
        },

        ---Only scripts ending in *.http.js, *.http.ts and *.http.lua will be treated as HTTP scripts and
        ---have LSP capabilities, unless `enforce_external_script_naming_convention` is set to false.
        ---This allows users to have non-HTTP scripts with the same filetypes without LSP interference.
        ---@type boolean
        enforce_external_script_naming_convention = true,

        --enable/disable/customize  LSP keymaps
        ---@type boolean|table
        keymaps = false, -- disabled by default, as Kulala relies on default Neovim LSP keymaps

        on_attach = nil, -- function called when Kulala LSP attaches to the buffer
      },

      -- enable/disable debug mode
      debug = 3,
      -- enable/disable bug reports on all errors
      generate_bug_report = false,

      -- set to true to enable default keymaps
      -- (see docs or lua/kulala/config/keymaps.lua)
      -- or override default keymaps as shown in the example below.
      ---@type boolean|table
      global_keymaps = true,

      -- Prefix for global keymaps
      global_keymaps_prefix = '<leader>R',

      -- Kulala UI keymaps; override with custom keymaps as required
      -- (see docs or lua/kulala/config/keymaps.lua)
      ---@type boolean|table
      kulala_keymaps = true,

      kulala_keymaps_prefix = '',
    },
  },
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile = { enabled = true },
      dashboard = { enabled = false },
      explorer = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      picker = { enabled = false },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = false },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    },
  },
}
