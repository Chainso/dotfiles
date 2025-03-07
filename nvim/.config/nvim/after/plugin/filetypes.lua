vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = "*.avsc",
    command = "set filetype=json"
})
