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
        tag = '0.1.1',
        dependencies = {'nvim-lua/plenary.nvim', "telescope-fzf-native"},
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
    }, 'airblade/vim-gitgutter',

    {'sstallion/vim-wtf', name = 'vim-wtf', lazy = false, priority = 1000}, {
        'sstallion/lightline-wtf',
        name = 'lightline-wtf',
        lazy = false,
        priority = 999
    }, {'itchyny/lightline.vim', dependencies = {'vim-wtf', 'lightline-wtf'}},

    -- Need for lightline
    'tpope/vim-fugitive', 'rhysd/vim-clang-format', {
        'ludovicchabant/vim-gutentags',
        init = function()
            vim.g.gutentags_enabled = 1
            vim.g.gutentags_generate_on_missing = 1
            vim.g.gutentags_ctags_exclude = {'*gcc-arm-none-eabi-*'}
            vim.g.gutentags_cache_dir = os.getenv("HOME") .. "/.config/tags/"
        end
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
                ensure_installed = {"clangd", "pyright"},
                automatic_installation = true
            }
            require'lspconfig'.clangd.setup {
                capabilities = {offsetEncoding = 'utf-8'}
            }

        end,
        dependencies = {
            'williamboman/mason-lspconfig.nvim', 'neovim/nvim-lspconfig'
        }
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
                highlight = {enable = true},
                indent = {enable = false},
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
        -- event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            {'ms-jpq/coq.artifacts', branch = 'artifacts'},
            {'ms-jpq/coq.thirdparty', branch = '3p'}
        },
        build = ":COQdeps"
    }, {
        'jose-elias-alvarez/null-ls.nvim',
        init = function()
            null_ls = require('null-ls')
            null_ls.setup {
                sources = {
                    null_ls.builtins.formatting.black,
                    null_ls.builtins.formatting.isort,
                    null_ls.builtins.formatting.clang_format,
                    null_ls.builtins.formatting.lua_format,
                    null_ls.builtins.formatting.zigfmt

                }
            }
        end
    }, {
        "folke/trouble.nvim",
        dependencies = {"nvim-tree/nvim-web-devicons"},
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    }
}
