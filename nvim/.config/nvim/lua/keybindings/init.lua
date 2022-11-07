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

-- Navigation
r.nnoremap("<C-d>", "<C-d>zz")
r.nnoremap("<C-u>", "<C-u>zz")
r.nnoremap("<C-b>", "<C-b>zz")
r.nnoremap("<C-f>", "<C-f>zz")

