local r = require("keybindings/remap")

-- File management
r.nnoremap("<leader>ep", "<CMD>:E<CR>")
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

-- LSP
r.nnoremap("gd", ":lua vim.lsp.buf.definition()<cr>")
r.nnoremap("gD", ":lua vim.lsp.buf.declaration()<cr>")
r.nnoremap("gi", ":lua vim.lsp.buf.implementation()<cr>")
r.nnoremap("gw", ":lua vim.lsp.buf.document_symbol()<cr>")
r.nnoremap("gw", ":lua vim.lsp.buf.workspace_symbol()<cr>")
r.nnoremap("gr", ":lua vim.lsp.buf.references()<cr>")
r.nnoremap("gt", ":lua vim.lsp.buf.type_definition()<cr>")
r.nnoremap("K", ":lua vim.lsp.buf.hover()<cr>")
r.nnoremap("<C-k>", ":lua vim.lsp.buf.signature_help()<cr>")
r.nnoremap("<leader>af", ":lua vim.lsp.buf.code_action()<cr>")
r.nnoremap("<leader>rn", ":lua vim.lsp.buf.rename()<cr>")
