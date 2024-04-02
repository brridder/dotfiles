vim.api.nvim_create_autocmd( {"BufRead", "BufNewFile"}, {pattern = {"*.md"}, command = "set spell"})
vim.api.nvim_create_autocmd( {"BufRead", "BufNewFile"}, {pattern = {"*.gn", "*.gni"}, command = "set filetype=gn"})

vim.api.nvim_create_autocmd( {"VimResized"}, {pattern={"*"}, command = ":wincmd ="})

vim.api.nvim_create_autocmd( {"Filetype"}, {pattern={"python"}, command = "set softtabstop=4"})
vim.api.nvim_create_autocmd( {"Filetype"}, {pattern={"python"}, command = "set tabstop=4"})
vim.api.nvim_create_autocmd( {"Filetype"}, {pattern={"python"}, command = "set shiftwidth=4"})
