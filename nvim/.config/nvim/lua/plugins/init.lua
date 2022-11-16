local setup = function(use)
  require("plugins/util")(use)
  require("plugins/colorscheme")(use)
  require("plugins/navigation")(use)
  require("plugins/file-management")(use)
  require("plugins/editing")(use)
  require("plugins/ui")(use)
  require("plugins/command")(use)
  require("plugins/terminal")(use)
  require("plugins/debugging")(use)
  require("plugins/treesitter")(use)
  require("plugins/lsp")(use)
  require("plugins/practice")(use)
end

return setup

