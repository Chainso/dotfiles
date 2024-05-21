local r = require("keybindings/remap")

-- File management
r.nnoremap("<leader>ep", "<CMD>NvimTreeToggle<CR>")
r.nnoremap("<leader>ff", "<CMD>Telescope find_files<CR>")
r.nnoremap("<leader>fg", "<CMD>Telescope live_grep<CR>")
r.nnoremap("<leader>fb", "<CMD>Telescope buffers<CR>")
r.nnoremap("<leader>fh", "<CMD>Telescope help_tags<CR>")
r.nnoremap("<leader>fp", "<CMD>Telescope projects<CR>")
r.nnoremap("<leader>fs", "<CMD>Telescope lsp_dynamic_workspace_symbols<CR>")
r.nnoremap("<leader>fr", "<CMD>Telescope resume<CR>")
r.nnoremap("<leader>w", "<CMD>Bdelete<CR>")

-- Clipboard
r.xnoremap("<leader>bp", "\"_dP")

r.nnoremap("<leader>p", "\"+p")
r.xnoremap("<leader>p", "\"+p")
r.nnoremap("<leader>y", "\"+y")
r.vnoremap("<leader>y", "\"+y")
r.nnoremap("<leader>d", "\"_d")
r.vnoremap("<leader>d", "\"_d")

-- Searching
r.nnoremaps("<ESC>", "<ESC><CMD>noh<CR><CMD>lua require('notify').dismiss()<CR>", {silent = true})
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
r.nnoremap("[m", "[mzz")
r.nnoremap("]m", "]mzz")
r.nnoremap("<leader>ht", "<CMD>Telescope harpoon marks<CR>")
r.nnoremap("<leader>hm", "<CMD>lua require(\"harpoon.ui\").toggle_quick_menu()<CR>")
r.nnoremap("<leader>ha", "<CMD>lua require(\"harpoon.mark\").add_file()<CR>")
r.nnoremap("<leader>hp", "<CMD>lua require(\"harpoon.ui\").nav_prev()<CR>")
r.nnoremap("<leader>hn", "<CMD>lua require(\"harpoon.ui\").nav_next()<CR>")

r.nnoremap("<leader>h1", "<CMD>lua require(\"harpoon.ui\").nav_file(1)<CR>")
r.nnoremap("<leader>h2", "<CMD>lua require(\"harpoon.ui\").nav_file(2)<CR>")
r.nnoremap("<leader>h3", "<CMD>lua require(\"harpoon.ui\").nav_file(3)<CR>")
r.nnoremap("<leader>h4", "<CMD>lua require(\"harpoon.ui\").nav_file(4)<CR>")
r.nnoremap("<leader>h5", "<CMD>lua require(\"harpoon.ui\").nav_file(5)<CR>")
r.nnoremap("<leader>h6", "<CMD>lua require(\"harpoon.ui\").nav_file(6)<CR>")
r.nnoremap("<leader>h7", "<CMD>lua require(\"harpoon.ui\").nav_file(7)<CR>")
r.nnoremap("<leader>h8", "<CMD>lua require(\"harpoon.ui\").nav_file(8)<CR>")
r.nnoremap("<leader>h9", "<CMD>lua require(\"harpoon.ui\").nav_file(9)<CR>")

r.nnoremap("vd", "<cmd>STSSwapCurrentNodeNextNormal<cr>")
r.nnoremap("vu", "<cmd>STSSwapCurrentNodePrevNormal<cr>")
r.nnoremap("vD", "<cmd>STSSwapDownNormal<cr>")
r.nnoremap("vU", "<cmd>STSSwapUpNormal<cr>")
r.nnoremap("vx", "<cmd>STSSelectMasterNode<cr>")
r.nnoremap("vn", "<cmd>STSSelectCurrentNode<cr>")
r.xnoremap("H", "<cmd>STSSelectNextSiblingNode<cr>")
r.xnoremap("L", "<cmd>STSSelectPrevSiblingNode<cr>")
r.xnoremap("J", "<cmd>STSSelectParentNode<cr>")
r.xnoremap("K", "<cmd>STSSelectChildNode<cr>")
r.xnoremap("<A-j>", "<cmd>STSSwapPrevVisual<cr>")
r.xnoremap("<A-k>", "<cmd>STSSwapNextVisual<cr>")

-- Terminal
r.tnoremap("<ESC>", "<C-\\><C-n>")
r.nnoremap("<leader>tj", "1<CMD>ToggleTerm direction=vertical<CR>")
r.nnoremap("<leader>tk", "2<CMD>ToggleTerm direction=horizontal<CR>")

-- Debugging
r.nnoremap("<leader>dbui", "<CMD>DapUiToggle<CR>")
r.nnoremap("<leader>dbg", "<CMD>DapContinue<CR>")
r.nnoremap("<leader>dbin", "<CMD>DapStepInto<CR>")
r.nnoremap("<leader>dbou", "<CMD>DapStepOut<CR>")
r.nnoremap("<leader>dbov", "<CMD>DapStepOver<CR>")
r.nnoremap("<leader>dbs", "<CMD>DapStop<CR>")
r.nnoremap("<leader>dbp", "<CMD>DapToggleBreakpoint<CR>")

-- LSP
r.nnoremap("gd", "<CMD>lua vim.lsp.buf.definition()<CR>")
r.nnoremap("gD", "<CMD>lua vim.lsp.buf.declaration()<CR>")
r.nnoremap("gi", "<CMD>lua vim.lsp.buf.implementation()<CR>")
r.nnoremap("gw", "<CMD>lua vim.lsp.buf.document_symbol()<CR>")
r.nnoremap("gw", "<CMD>lua vim.lsp.buf.workspace_symbol()<CR>")
r.nnoremap("gr", "<CMD>Lspsaga finder<CR>")
r.nnoremap("gt", "<CMD>lua vim.lsp.buf.type_definition()<CR>")
r.nnoremap("gk", "<CMD>Lspsaga hover_doc<CR>")
r.nnoremap("gK", "<CMD>Lspsaga peek_definition<CR>")
r.nnoremap("gl", "<CMD>lua vim.lsp.buf.format()<CR>")
r.nnoremap("<leader>af", "<CMD>Lspsaga code_action<CR>")
r.nnoremap("<leader>rn", ":IncRename ")
r.nnoremap("[e", "<CMD>Lspsaga diagnostic_jump_prev<CR>")
r.nnoremap("]e", "<CMD>Lspsaga diagnostic_jump_next<CR>")
r.nnoremap("<leader>cd", "<CMD>Lspsaga show_cursor_diagnostics<CR>")
r.ienoremap("<M-Enter>", "copilot#Accept(\"<CR>\")")

-- Source Control
r.nnoremap("<leader>hs", "<CMD>Gitsigns stage_hunk<CR>")
r.nnoremap("<leader>hr", "<CMD>Gitsigns reset_hunk<CR>")
r.nnoremap("<leader>dvo", "<CMD>DiffviewOpen<CR>")
r.nnoremap("<leader>dvc", "<CMD>DiffviewClose<CR>")
