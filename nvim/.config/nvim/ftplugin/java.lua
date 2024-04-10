local capabilities = require("cmp_nvim_lsp").default_capabilities()

local data_path = vim.fn.stdpath("data")
local jdtls_dir = data_path .. "/mason/packages/jdtls"
local java_debug_path = data_path .. "/site/pack/java-debug"
local vscode_java_test_path = data_path .. "/site/pack/vscode-java-test"

local root_dir = require("jdtls.setup").find_root({".git", "mvnw", "gradlew"})
local home = os.getenv("HOME")
local workspace_root = home .. "/.local/share/jdtls"
vim.fn.mkdir(workspace_root, "p")
local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")

local jdtls = require("jdtls")

jdtls.start_or_attach({
  cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xms1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens", "java.base/java.util=ALL-UNNAMED",
    "--add-opens", "java.base/java.lang=ALL-UNNAMED",
    "-jar", vim.fn.glob(jdtls_dir .. "/plugins/org.eclipse.equinox.launcher_*", 1),
    "-configuration", jdtls_dir .. "/config_linux",
    "-data", workspace_root .. "/" .. project_name,
  },

  root_dir = root_dir,

  capabilities = capabilities,

  on_attach = function(client, bufnr)
    -- TODO: find out if needed after semantic tokens is merged upstream with neovim
    -- local caps = client.server_capabilities
    -- if caps.semanticTokensProvider and caps.semanticTokensProvider.full then
    --   local augroup = vim.api.nvim_create_augroup("SemanticTokens", {})
    --   vim.api.nvim_create_autocmd("TextChanged", {
    --     group = augroup,
    --     buffer = bufnr,
    --     callback = function()
    --       vim.lsp.buf.semantic_tokens_full()
    --     end,
    --   })
    --   -- fire it first time on load as well
    --   vim.lsp.buf.semantic_tokens_full()
    -- end

    -- With `hotcodereplace = "auto" the debug adapter will try to apply code changes
    -- you make during a debug session immediately.
    -- Remove the option if you do not want that.
    -- You can use the `JdtHotcodeReplace` command to trigger it manually
    jdtls.setup_dap({ hotcodereplace = "auto" })
  end,

  init_options = {
    bundles = {
      vim.fn.glob(java_debug_path .. "/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar", 1),
      unpack(vim.split(vim.fn.glob(vscode_java_test_path .. "/server/*.jar", 1), "\n"))
    }
  }
})

