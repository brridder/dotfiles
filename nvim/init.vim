" vimrc - vim configuration

" Plugin Section
call plugpac#begin()
Pack 'k-takata/minpac', {'type': 'opt'}
Pack 'junegunn/fzf', { 'do': { -> fzf#install() } }
Pack 'sstallion/vim-whitespace'
Pack 'airblade/vim-gitgutter'
Pack 'itchyny/lightline.vim'
Pack 'rhysd/vim-clang-format'
Pack 'ludovicchabant/vim-gutentags'
Pack 'https://gn.googlesource.com/gn', { 'rtp': 'misc/vim' }
Pack 'fidian/hexmode'
Pack 'sstallion/vim-wtf'
Pack 'sstallion/lightline-wtf'
Pack 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Pack 'hrsh7th/nvim-compe'

"Need for lightline
Pack 'tpope/vim-fugitive'

Pack 'neovim/nvim-lspconfig'
"Pack 'nvim-lua/plenary.nvim'

Pack 'gryf/wombat256grf'
Pack 'jnurmine/Zenburn'
Pack 'doums/darcula'
Pack 'ziglang/zig.vim'
call plugpac#end()

set nocompatible

if has('autocmd')
  filetype plugin indent on
endif

if has('syntax')
  syntax on
endif

" Default Options
"set nobackup
set noerrorbells
set nojoinspaces
"set noswapfile
set nowrap

" Protect changes between writes. Default values of
" updatecount (200 keystrokes) and updatetime
" (4 seconds) are fine
set swapfile
set directory^=~/.vim/swap//

" protect against crash-during-write
set writebackup
" but do not persist backup after successful write
set nobackup
" use rename-and-write-new method whenever safe
set backupcopy=auto
" patch required to honor double slash at end
if has("patch-8.1.0251")
  " consolidate the writebackups -- not a big
  " deal either way, since they usually get deleted
  set backupdir^=~/.vim/backup//
end

" persist the undo tree for each file
set undofile
set undodir^=~/.vim/undo//

set autowrite
set backspace=indent,eol,start
set hidden
set ignorecase
set laststatus=2
set lazyredraw
set modeline
set number
set ruler
set showmatch
set showmode
set smartcase
set splitright
set switchbuf=usetab
set timeoutlen=2000
set ttimeoutlen=0
set ttyfast

set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc,*/build/,build/**
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest:list

set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set directory-=.                                             " don't store swapfiles in the current directory
set encoding=utf-8
set incsearch                                                " search as you type
set list                                                     " show trailing whitespace
set listchars=tab:▸\ ,trail:▫

" Feature Options
if has('clipboard')
  set clipboard=unnamed
  if has('unnamedplus')
    set clipboard+=unnamedplus
  endif
endif

if has('diff')
  set diffopt=filler,context:3
endif

if has('extra_search')
  set nohlsearch
endif

if has('folding')
  set foldenable
  set foldlevelstart=20
  "set foldmethod=syntax
endif

if has('mksession')
  set sessionoptions-=buffers
endif

if has('mouse')
  set mouse=a
  if has('mouse_sgr')
    set ttymouse=sgr
  endif

  if exists('$TMUX')  " Support resizing in tmux
    set ttymouse=xterm2
  endif
endif

set noshowmode "Lightline handles this

" if has('syntax')
  " set cursorline
" endif

if has('windows')
  set showtabline=2
  set winminheight=0
endif

" Default Indentation
set autoindent
set shiftround
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=8
set textwidth=120

" Other
" set cursorline
" set cursorcolumn
" Key Mappings

let mapleader = ','
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

nnoremap <leader>] :TagbarToggle<CR>

" noremap <C-J> <PageDown>
" noremap <C-K> <PageUp>

noremap <silent> <Leader>n :set hlsearch!<CR>
noremap <silent> <Leader>p :set paste!<CR>
noremap <silent> <Leader>r :set relativenumber!<CR>
noremap <silent> <Leader>s :set spell!<CR>
noremap <silent> <leader>x :Hexmode <CR>
noremap <silent> <leader>c :ClangFormat <CR>

noremap <silent> [b :bprevious<CR>
noremap <silent> ]b :bnext<CR>

noremap <silent> [t :tabprev<CR>
noremap <silent> ]t :tabnext<CR>

nnoremap <leader><space> :WhitespaceStrip<CR>
nnoremap <leader>g :GitGutterToggle<CR>

noremap <Leader>t :FZF<CR>
noremap <Leader>b :Buffers<CR>

" Remote terminals don't cope particularly well with arrow keys in
" insert mode. The key mappings proposed in Solution 15 works around the
" issue without having to modify the 'term' option;
" see: http://vim.wikia.com/wiki/Fix_arrow_keys_that_display_A_B_C_D_on_remote_shell.
inoremap <Esc>oA <Esc>ki
inoremap <Esc>oB <Esc>ji
inoremap <Esc>oC <Esc>li
inoremap <Esc>oD <Esc>hi

map Q <Nop>

" fdoc is yaml
autocmd BufRead,BufNewFile *.fdoc set filetype=yaml
" md is markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.md set spell

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

let g:whitespace_strip_enabled = 1

let g:whitespace_ignore_tabs = [
      \ 'git',
      \ 'gitcommit',
      \ 'gitconfig',
      \ 'gitrebase',
      \ 'gitsendemail',
      \ ]

" Fix Cursor in TMUX
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Color Scheme
"colorscheme wtf
"colorscheme wombat256grf
colorscheme wombat256grf
highlight! link ExtraWhitespace ErrorMsg

let g:gutentags_enabled=1
let g:gutentags_generate_on_missing=1
let g:gutentags_exclude = [ '*gcc-arm-none-eabi-*' ]

let g:clang_format#style_options = {
      \ "BasedOnStyle" : "google",
      \ "ColumnLimit" : 100,
      \ "BinPackArguments" : "false",
      \ "BinPackParameters" : "false",
      \ "AllowShortFunctionsOnASingleLine" : "Inline",
      \ "SortUsingDeclarations" : "true"}

let g:clang_format#detect_style_file = 1
let g:clang_format#enable_fallback_style = 0

autocmd FileType cpp ClangFormatAutoEnable
autocmd FileType c ClangFormatAutoEnable

autocmd FileType python set softtabstop=2
autocmd FileType python set tabstop=2
autocmd FileType python set shiftwidth=2

" treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    "bash",
    "c",
    "cmake",
    "cpp",
    "dockerfile",
    "graphql",
    "html",
    "javascript",
    "json",
    "jsonc",
    "lua",
    "python",
    "scss",
    "typescript",
    "yaml",
    "zig",
  },
}
EOF

" Language server providers
lua << EOF
vim.lsp.set_log_level("debug")
local lspconfig = require'lspconfig'
local scan = require'plenary.scandir'
local Path = require'plenary.path'

function get_compile_commands(fname)
  local results =  scan.scan_dir(fname, { search_pattern = "compile_commands.json" })
  if results[0] ~= nil then
    return Path:new(results[0]):parent()
  else
    return Path:new(results[1]):parent()
  end
end

--local compile_commands_dir = get_compile_commands(vim.loop.cwd())

lspconfig.clangd.setup{}

lspconfig.pyright.setup{}

--local on_attach = function(_, bufnr)
  --vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  --require('completion').on_attach()
--end

local servers = {'zls'}
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
  --      on_attach = on_attach,
    }
end
--lspconfig.zig.setup{}

EOF

" Completion
set completeopt=menuone,noselect,noinsert

lua <<EOF
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    ultisnips = true;
    luasnip = true;
  };
}
EOF

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
"inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
"inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
