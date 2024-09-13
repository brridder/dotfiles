return {
  -- {'junegunn/fzf', 'build' = "-> fzf#install()"},
  -- 'junegunn/fzf.vim',
  {
    'sstallion/vim-whitespace',
    init = function()
      vim.g.whitespace_strip_enabled = 1
      vim.g.whitespace_ignore_tabs = {
        'git', 'gitcommit', 'gitconfig', 'gitrebase', 'gitsendemail'
      }
    end
  }, 'airblade/vim-gitgutter', {
  'junegunn/seoul256.vim',
  lazy = false,
  priority = 1000,
  init = function()
    vim.cmd("colorscheme seoul256")
    vim.cmd("set background=dark")
  end
}, {
  'nvim-telescope/telescope.nvim',
  lazy = false,
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim', "telescope-fzf-native" },
  init = function()
    local builtin = require('telescope.builtin')
    local actions = require('telescope.actions')
    vim.keymap.set('n', '<leader>tf', builtin.find_files, {})
    vim.keymap.set('n', '<leader>tb', builtin.buffers, {})
    vim.keymap.set('n', '<leader>td', builtin.lsp_definitions, {})
    vim.keymap.set('n', '<leader>ti', builtin.lsp_implementations, {})
    vim.keymap.set('n', '<leader>tr', builtin.lsp_references, {})
    require('telescope').setup {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case"
      },
      defaults = {
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous
          }
        }
      }

    }
    require('telescope').load_extension('fzf')
  end
}, {
  'nvim-telescope/telescope-fzf-native.nvim',
  lazy = false,
  name = "telescope-fzf-native",
  build = 'make'
}, 'airblade/vim-gitgutter', {
  'nvim-lualine/lualine.nvim',
  init = function()
    require("lualine").setup {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    }
  end,
  dependencies = { 'nvim-tree/nvim-web-devicons' }
}, {
  'ludovicchabant/vim-gutentags',
  init = function()
    vim.g.gutentags_enabled = 1
    vim.g.gutentags_generate_on_missing = 1
    vim.g.gutentags_ctags_exclude = { '*gcc-arm-none-eabi-*' }
    vim.g.gutentags_cache_dir = os.getenv("HOME") .. "/.config/tags/"
  end,
}, {
  url = 'https://gn.googlesource.com/gn',
  config = function(plugin)
    vim.opt.rtp:append(plugin.dir .. "/misc/vim")
  end
}, 'fidian/hexmode', {
  "williamboman/mason.nvim",
  build = ":MasonUpdate", -- :MasonUpdate updates registry contents
  init = function()
    require("mason").setup()
    require("mason-lspconfig").setup {
      ensure_installed = { "clangd", "pyright" },
      automatic_installation = true
    }

    require("mason-lspconfig").setup_handlers {
      function(server_name) -- default handler
        require("lspconfig")[server_name].setup {}
      end,

      ["ruff_lsp"] = function()
        require("lspconfig").ruff_lsp.setup {
          capabilities = caps,
          init_options = {
            settings = { args = { '--target_version', 'py311' } }
          }
        }
      end,
      ["clangd"] = function()
        require 'lspconfig'.clangd.setup {
          capabilities = { offsetEncoding = 'utf-8' }
        }
      end
    }
  end,
  dependencies = {
    'williamboman/mason-lspconfig.nvim', 'neovim/nvim-lspconfig'
  }
}, {
  "jay-babu/mason-null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "nvimtools/none-ls.nvim",
  },
  init = function()
    require('mason-null-ls').setup {
      ensure_installed = {},
      automatic_installation = true,
      handlers = {},
    }
  end,
  -- config = function()
  --   require("your.null-ls.config")   -- require your null-ls config here (example below)
  -- end,
}, {
  'rhysd/vim-clang-format',
  init = function()
    vim.g["clang_format#style_options"] = [[{
      \ "BasedOnStyle" : "google",
      \ "ColumnLimit" : 100,
      \ "BinPackArguments" : "false",
      \ "BinPackParameters" : "false",
      \ "AllowShortFunctionsOnASingleLine" : "Inline",
      \ "SortUsingDeclarations" : "true"} ]]
    vim.g["clangformat#detect_style_file"] = true
    vim.g["clangformat#enable_fallback_style"] = false
  end
}, {
  'nvim-treesitter/nvim-treesitter',
  build = ":TSUpdate",
  init = function()
    require('nvim-treesitter.configs').setup {
      highlight = { enable = true },
      indent = { enable = false },
      auto_install = true,
      ensure_installed = {
        "bash", "c", "cmake", "cpp", "dockerfile", "graphql",
        "html", "javascript", "json", "jsonc", "lua", "python",
        "scss", "typescript", "yaml", "zig"
      }
    }
  end
}, {
  -- 'neovim/nvim-lspconfig'
  -- event = { "BufReadPre", "BufNewFile" },
  -- dependencies = { 'p00f/clangd_extensions.nvim' },
  -- config = function()
  -- local util = require'lspconfig.util'
  -- require('lspconfig').pyright.setup({
  -- root_dir = function(...)
  -- return util.root_pattern('pyrightconfig.json')(...)
  -- end
  -- })
  -- require('clangd_extensions').setup()
  -- end,
}, {
  'ms-jpq/coq_nvim',
  lazy = false,
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { 'ms-jpq/coq.artifacts',  branch = 'artifacts' },
    { 'ms-jpq/coq.thirdparty', branch = '3p' }
  },
  build = ":COQdeps",
  init = function()
    vim.g.coq_settings = {
      auto_start = 'shut-up',
      display = { icons = { mode = 'none' } },
      keymap = { jump_to_mark = 'none' },
      -- clients = {lsp = {resolve_timeout = 0.1}},
    }
  end,
}, {
  'nvimtools/none-ls.nvim',
  init = function()
    null_ls = require('null-ls')
    null_ls.setup {
      sources = {
        -- null_ls.builtins.formatting.black,
        --null_ls.builtins.formatting.isort,
        --null_ls.builtins.formatting.clang_format,
        --null_ls.builtins.formatting.lua_format,
        --null_ls.builtins.formatting.zigfmt
      }
    }
  end
}, {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {}
}, {
  "dgagn/diagflow.nvim",
  event = "LspAttach",
  opts = {
    scope = "line",
    inline_padding_left = 3,
    max_height = 20,
    show_sign = true
  }
}, { "astral-sh/ruff-lsp", event = "LspAttach"
}, {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
}
