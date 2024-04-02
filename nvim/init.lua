require('lazy_bootstrap')
require('key_mapping')
require('set')

vim.opt.completeopt = {'menuone','noselect','noinsert'}
vim.g.coq_settings = {
  auto_start = 'shut-up',
  display = { icons = { mode = 'none'} },
  keymap = { jump_to_mark = 'none'},
}

require('lazy').setup('plugins',
{ui = {
    icons = {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
  },})
require('autocmds')

require('coq')

vim.lsp.set_log_level("off")
