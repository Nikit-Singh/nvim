------------------------------------------------
--                                            --
--    This is a main configuation file for    --
--                    ZapVim                  --
--      Change variables which you need to    --
--                                            --
------------------------------------------------

local icons = require('icons')

ZapVim = {
  colorscheme = 'tokyonight',
  colorscheme_variant = 'storm',
  ui = {
    float = {
      border = 'single'
    }
  },
  plugins = {
    completion = {
      select_first_on_enter = false
    },
    dashboard = {
      fuzzy_plugin = 'telescope' -- telescope/clap/fzf
    },
    rooter = {
      -- Removing package.json from list in Monorepo Frontend Project can be helpful
      -- By that your live_grep will work related to whole project, not specific package
      patterns = {'.git', 'package.json', '_darcs', '.bzr', '.svn', 'Makefile', '.github'} -- Default
    },
  },
  icons = icons,
  statusline = {
    path_enabled = true,
    path = 'relative' -- absolute/relative
  }
}


