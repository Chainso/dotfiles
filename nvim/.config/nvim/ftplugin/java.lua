local capabilities = require("cmp_nvim_lsp").default_capabilities()

local jdtls_dir = os.getenv("HOME") .. "/.local/share/nvim/mason/packages/jdtls"
local root_dir = require("jdtls.setup").find_root({".git", "mvnw", "gradlew"})

local workspace_root = os.getenv("HOME") .. "/" .. ".local/share/jdtls"
vim.fn.mkdir(workspace_root, "p")
local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")

require("jdtls").start_or_attach({
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
    "-jar", jdtls_dir .. "/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
    "-configuration", jdtls_dir .. "/config_linux",
    "-data", workspace_root .. "/" .. project_name,
  },
  root_dir = root_dir,
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    local caps = client.server_capabilities
    if caps.semanticTokensProvider and caps.semanticTokensProvider.full then
      local augroup = vim.api.nvim_create_augroup("SemanticTokens", {})
      vim.api.nvim_create_autocmd("TextChanged", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.semantic_tokens_full()
        end,
      })
      -- fire it first time on load as well
      vim.lsp.buf.semantic_tokens_full()
    end
  end
})

