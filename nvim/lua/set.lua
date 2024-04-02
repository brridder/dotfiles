
vim.opt.compatible = false

vim.opt.errorbells = false
vim.opt.joinspaces = false
vim.opt.wrap = false

-- Protect changes between writes. Default values of
-- updatecount (200 keystrokes) and updatetime
-- (4 seconds) are fine
vim.opt.swapfile = true

vim.cmd([[
  filetype plugin indent on
  set directory^=~/.vim/swap//
  set directory-=.    " don't store swapfiles in the current directory
  set backupdir^=~/.vim/backup//
  set undodir^=~/.vim/undo//
  set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc,*/build/,build/**,out/**
  set wildmode=longest:list
  set listchars=tab:▸\ ,trail:▫

  highlight! link ExtraWhitespace ErrorMsg
]])
--vim.opt.directory = os.getenv("HOME") .. "/.vim/swap"
--vim.opt.undodir = os.getenv("HOME") .. "/.vim/undo"
--vim.opt.backupdir = os.getenv("HOME") .. "/.vim/backup"

vim.opt.backup = false
vim.opt.writebackup = true
vim.opt.backupcopy = "auto"

vim.opt.undofile = true

vim.opt.autowrite = true

vim.opt.backspace={"indent", "eol", "start"}
vim.opt.hidden = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.laststatus = 2
vim.opt.lazyredraw = true
vim.opt.modeline = true
vim.opt.number = true
vim.opt.ruler = true

vim.opt.showmatch = true
vim.opt.showmode = true
vim.opt.smartcase = true
vim.opt.splitright = true
vim.opt.switchbuf = 'usetab'
vim.opt.timeoutlen = 2000
vim.opt.ttimeoutlen = 0
vim.opt.ttyfast = true

vim.opt.wildmenu = true -- show a navigable menu for tab completion

vim.opt.autoread = true -- reload files when changed on disk, i.e. via `git checkout`
vim.opt.encoding = "utf-8"
vim.opt.fileencodings = "utf-8"
vim.opt.incsearch = true -- search as you type
vim.opt.list = true -- show trailing whitespace

vim.opt.mouse = "a"
--vim.opt.ttymouse = "sgr"

-- Default Indentation
vim.opt.autoindent = true
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 8
vim.opt.textwidth = 120

vim.opt.cursorline = true

vim.opt.clipboard= {'unnamed', 'unnamedplus'}
