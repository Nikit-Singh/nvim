-- Config heavily inspired by https://github.dev/ecosse3/nvim
local loaded, impatient = pcall(require, "impatient")

if not loaded then
  vim.notify("Error loading impatient")
end

require "plugins"
require "globals"
require "config"
require "options"
require "colorscheme"
require "keymappings"

require "lsp.config"
require "lsp.setup"
require "lsp.functions"
