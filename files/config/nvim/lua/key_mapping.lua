vim.g.mapleader = ','

function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

map("", "<C-h>", "<C-w>h")
map("", "<C-j>", "<C-w>j")
map("", "<C-k>", "<C-w>k")
map("", "<C-l>", "<C-w>l")


map("", "<Leader>n", ":set hlsearch!<CR>")
map("", "<Leader>p", ":set paste!<CR>")
map("", "<Leader>r", ":set relativenumber!<CR>")
map("", "<Leader>s", ":set spell!<CR>")
map("", "<leader>x", ":Hexmode <CR>")
--map("", "<leader>c", ":ClangFormat <CR>")
map("", "<leader>c", ":lua vim.lsp.buf.format()<CR>")

map("", "[b", ":bprevious<CR>")
map("", "]b", ":bnext<CR>")

map("", "[t", ":tabprev<CR>")
map("", "]t", ":tabnext<CR>")

nmap("<leader><space>", ":WhitespaceStrip<CR>")
nmap("<leader>g", ":GitGutterToggle<CR>")

map("", "Q", "<Nop>")

--vim.cmd([[
--command! -bang -nargs=? -complete=dir FdFiles call fzf#run(fzf#wrap({ 'source': 'fd -t f'}))
--]])

--map("", "<Leader>t", ":FdFiles<CR>")
--map("", "<Leader>f", ":Files<CR>")
--map("", "<Leader>b", ":Buffers<CR>")
