local dap = require("dap")

dap.configurations.java = vim.tbl_extend('force', dap.configurations.java or {}, {
  {
    type = 'java',
    request = 'attach',
    name = "Debug (Attach) - Remote",
    hostName = "127.0.0.1",
    port = 5005,
  }
})
