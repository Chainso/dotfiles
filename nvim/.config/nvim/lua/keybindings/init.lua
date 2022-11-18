local r = require("keybindings/remap")

-- File management
r.nnoremap("<leader>ep", "<CMD>NvimTreeToggle<CR>")
r.nnoremap("<leader>ff", "<CMD>Telescope find_files<CR>")
r.nnoremap("<leader>fg", "<CMD>Telescope live_grep<CR>")
r.nnoremap("<leader>fb", "<CMD>Telescope buffers<CR>")
r.nnoremap("<leader>fh", "<CMD>Telescope help_tags<CR>")

-- Clipboard
r.xnoremap("<leader>bp", "\"_dP")

r.nnoremap("<leader>p", "\"+p")
r.xnoremap("<leader>p", "\"+p")
r.nnoremap("<leader>y", "\"+y")
r.vnoremap("<leader>y", "\"+y")
r.nnoremap("<leader>d", "\"_d")
r.vnoremap("<leader>d", "\"_d")


-- Searching
r.nnoremap("<CR>", "<CMD>noh<CR><CR>")
r.nnoremap("n", "nzz")
r.nnoremap("N", "Nzz")
r.nnoremap("<C-o>", "<C-o>zz")
r.nnoremap("<C-i>", "<C-i>zz")
r.nnoremap("*", "*zz")
r.nnoremap("#", "#zz")

-- Navigation
r.nnoremap("<C-d>", "<C-d>zz")
r.nnoremap("<C-u>", "<C-u>zz")
r.nnoremap("<C-b>", "<C-b>zz")
r.nnoremap("<C-f>", "<C-f>zz")
r.nnoremap("{", "{zz")
r.nnoremap("}", "}zz")

-- Terminal
r.tnoremap("<ESC>", "<C-\\><C-n>")

-- Debugging
r.nnoremap("<leader>dbg", "<CMD>lua require(\"dap\").continue()<CR>")
r.nnoremap("<leader>dbp", "<CMD>lua require(\"dap\").toggle_breakpoint()<CR>")

-- LSP
r.nnoremap("gd", "<CMD>lua vim.lsp.buf.definition()<CR>")
r.nnoremap("gD", "<CMD>lua vim.lsp.buf.declaration()<CR>")
r.nnoremap("gi", "<CMD>lua vim.lsp.buf.implementation()<CR>")
r.nnoremap("gw", "<CMD>lua vim.lsp.buf.document_symbol()<CR>")
r.nnoremap("gw", "<CMD>lua vim.lsp.buf.workspace_symbol()<CR>")
r.nnoremap("gr", "<CMD>Lspsaga lsp_finder<CR>")
r.nnoremap("gt", "<CMD>lua vim.lsp.buf.type_definition()<CR>")
r.nnoremap("gk", "<CMD>Lspsaga hover_doc<CR>")
r.nnoremap("gK", "<CMD>Lspsaga peek_definition<CR>")
r.nnoremap("gl", "<CMD>lua vim.lsp.buf.format()<CR>")
r.nnoremap("<leader>af", "<CMD>Lspsaga code_action<CR>")
r.nnoremap("<leader>rn", ":IncRename ")
r.nnoremap("[e", "<CMD>Lspsaga diagnostic_jump_prev<CR>")
r.nnoremap("]e", "<CMD>Lspsaga diagnostic_jump_next<CR>")
r.nnoremap("<leader>cd", "<CMD>Lspsaga show_cursor_diagnostics<CR>")

