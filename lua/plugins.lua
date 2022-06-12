local packer = require 'bootstrap'

return packer.startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Needed to load first
  use { 'lewis6991/impatient.nvim' }
  use { 'nathom/filetype.nvim' }
  use { 'nvim-lua/plenary.nvim' }
  use { 'kyazdani42/nvim-web-devicons' }
  use { 'goolord/alpha-nvim', config = "require 'plugins.alpha'" }

  -- Themes
  use { 'folke/tokyonight.nvim' }

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', config = "require 'plugins.treesitter'" }
  use { 'nvim-treesitter/nvim-treesitter-textobjects', after = { 'nvim-treesitter' } }
  use { 'RRethy/nvim-treesitter-textsubjects', after = { 'nvim-treesitter' } }
  use { 'm-demare/hlargs.nvim', config = function() require 'hlargs' .setup() end }
  use { 'JoosepAlviste/nvim-ts-context-commentstring', after = 'nvim-treesitter' }

  -- Navigating (Telescope/Tree/Refactor)
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { 'nvim-telescope/telescope.nvim',
    config = "require 'plugins.telescope'",
    requires = {
      { 'nvim-lua/popup.nvim' },
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim' }
    }
  }
  use { 'cljoly/telescope-repo.nvim' }
  use { 'kevinhwang91/nvim-bqf', ft = 'qf' }
  use { 'nvim-pack/nvim-spectre' }
  use { 'kyazdani42/nvim-tree.lua', config = "require 'plugins.nvim-tree'" }

  -- LSP Base
  use { 'williamboman/nvim-lsp-installer' }
  use { 'neovim/nvim-lspconfig' }

  -- LSP Cmp
  use { 'hrsh7th/nvim-cmp', event = 'InsertEnter', config = "require('plugins.cmp')" }
  use { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lsp', after = 'cmp-nvim-lua' }
  use { 'hrsh7th/cmp-buffer', after = 'cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-path', after = 'cmp-buffer' }
  use { 'hrsh7th/cmp-cmdline', after = 'cmp-path' }
  use { 'hrsh7th/cmp-calc', after = 'cmp-cmdline' }
  use { 'David-Kunz/cmp-npm', after = 'cmp-calc', requires = 'nvim-lua/plenary.nvim', config = "require('plugins.cmp-npm')" }
  use { 'saadparwaiz1/cmp_luasnip', after = 'cmp-npm' }

  -- LSP Addons
  use { 'stevearc/dressing.nvim', requires = 'MunifTanjim/nui.nvim', config = "require('plugins.dressing')" }
  use { 'onsails/lspkind-nvim' }
  use { 'folke/trouble.nvim', config = "require('plugins.trouble')" }
  use { 'nvim-lua/popup.nvim' }
  use { 'jose-elias-alvarez/typescript.nvim' }

  -- General
  use { 'numToStr/Comment.nvim', config = "require 'plugins.comment'" } -- Easy comment bindings
  use { 'tpope/vim-surround' } -- Change or delete surrounding quotes or bracket or tags
  use { 'tpope/vim-repeat' } -- Use . to repeat some weird non repeatable commands and also support vim-surround
  use { 'junegunn/vim-easy-align' } -- Easy align
  use { 'nacro90/numb.nvim', config = function () require 'numb' .setup() end } -- Peak line when type :linenumber
  use { 'mg979/vim-visual-multi' } -- Visual multi-cursors
  use { 'ggandor/lightspeed.nvim' } -- Easy motion
  use { 'antoinemadec/FixCursorHold.nvim' }
  use { 'iamcco/markdown-preview.nvim', run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" } }
  use { 'airblade/vim-rooter', setup = function() vim.g.rooter_patterns = ZapVim.plugins.rooter.patterns end }
  use { 'Shatur/neovim-session-manager', config = "require('plugins.session-manager')" }
  use { 'romgrk/barbar.nvim', requires = { 'kyazdani42/nvim-web-devicons' }, config = "require('plugins.barbar')" }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = "require 'plugins.lualine'"
  }
  -- Snippets & Language & Syntax
  use { 'windwp/nvim-autopairs', after = { 'nvim-treesitter', 'nvim-cmp' }, config = "require('plugins.autopairs')" }
  use { 'p00f/nvim-ts-rainbow', after = { 'nvim-treesitter' } }
  use { 'mattn/emmet-vim' }
  use { 'lukas-reineke/indent-blankline.nvim', config = "require('plugins.indent')" }
  use { 'NvChad/nvim-colorizer.lua', config = "require('plugins.colorizer')" }
  use { 'L3MON4D3/LuaSnip', requires = { 'rafamadriz/friendly-snippets' }, after = 'cmp_luasnip' }

  -- Git
  use { 'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = "require('plugins.gitsigns')",
    event = "BufRead"
  }
  use { 'sindrets/diffview.nvim' }
  use { 'akinsho/git-conflict.nvim', config = function() require('git-conflict').setup() end }

end)
