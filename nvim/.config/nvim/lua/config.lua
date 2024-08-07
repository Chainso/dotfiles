local g = vim.g
local o = vim.o

-- UI
o.termguicolors = true
o.number = true
o.relativenumber = true
o.signcolumn = "yes"
-- o.cursorline = true

-- File management
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- Searching
o.ignorecase = true
o.smartcase = true
o.hlsearch = true
o.incsearch = true

-- Editing
o.expandtab = true
o.smarttab = true
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.smartindent = true
o.wrap = true
o.clipboard = "unnamedplus"

-- Command
o.wildmenu = true
o.wildmode = "longest,list,full"

-- Keybindings
g.mapleader = " "

-- LSP
g.copilot_no_tab_map = true
g.copilot_assume_mapped = true
g.copilot_filetypes = {
  dapui_watches = false,
  dapui_stacks = false,
  dapui_breakpoints = false,
  dapui_scopes = false,
  dapui_console = false,
  dapui_repl = false,
  markdown = true
}
vim.lsp.set_log_level("error")

-- Sessions
o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Sudo
g.suda_smart_edit = 1
