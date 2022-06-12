local loaded, alpha = pcall(require, "alpha")

if not loaded then
  return
end

local dashboard = require("alpha.themes.dashboard")
local icons = require("icons")
local if_nil = vim.F.if_nil
local fn = vim.fn
local config_dir = fn.stdpath('config')

local header = {
"__/\\\\\\\\\\\\_________________________/\\\\\\\\\\_______________",
"__\\////\\\\\\_______________________/\\\\\\///_______________",
"______\\/\\\\\\______________________/\\\\\\_______/\\\\\\_______",
"_______\\/\\\\\\________/\\\\\\\\\\_____/\\\\\\\\\\\\\\\\\\___\\///_______",
"________\\/\\\\\\______/\\\\\\///\\\\\\__\\////\\\\\\//_____/\\\\\\_____",
"_________\\/\\\\\\_____/\\\\\\__\\//\\\\\\____\\/\\\\\\______\\/\\\\\\____",
"__________\\/\\\\\\____\\//\\\\\\__/\\\\\\_____\\/\\\\\\______\\/\\\\\\___",
"_________/\\\\\\\\\\\\\\\\\\__\\///\\\\\\\\\\/______\\/\\\\\\______\\/\\\\\\__",
"_________\\/////////_____\\/////________\\///_______\\///__",
}

dashboard.section.header.type = "text";
dashboard.section.header.val = header;
dashboard.section.header.opts = {
  position = "center",
  hl = "ZapVimHeader",
}


local section = {
  header = dashboard.section.header,
}

local opts = {
  layout = {
    {type = "padding", val = 5},
    section.header,
    {type = "padding", val = 1},
    {},
    {},
    {},
    {type = "padding", val = 2},
    {},
    {type = "padding", val = 5},
    {},
  },
  opts = {
    margin = 5
  },
}

-- alpha.setup(opts)
alpha.setup(require "alpha.themes.dashboard".config)

