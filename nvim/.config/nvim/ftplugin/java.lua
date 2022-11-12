local jdtls_dir = os.getenv("HOME") .. "/.local/share/nvim/mason/packages/jdtls"
local root_dir = require("jdtls.setup").find_root({".git", "mvnw", "gradlew"})
local data_dir_name = ".jdtls"

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
    "-data", root_dir .. "/" .. data_dir_name
  },
  root_dir = root_dir
})

