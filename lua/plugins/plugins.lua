local packer = require("bootstrap")

return packer.startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Needed to load first
    use { 'lewis6991/impatient.nvim' }
    use { 'nathom/filetype.nvim' }
    use { 'nvim-lua/plenary.nvim' }
    use { 'kyazdani42/nvim-web-devicons' }
    use { 'goolord/alpha-nvim', config = "require('plugins.alpha')" }
    
    -- Themes
    use { 'folke/tokyonight.nvim' }

    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter', config = "require('plugins.treesitter')" }
    use { 'nvim-treesitter/nvim-treesitter-textobjects', after = { 'nvim-treesitter' } }
    use { 'RRethy/nvim-treesitter-textsubjects', after = { 'nvim-treesitter' } }
    use { 'm-demare/hlargs.nvim', config = function() require('hlargs').setup() end }

    -- Navigating (Telescope/Tree/Refactor)
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use { 'nvim-telescope/telescope.nvim',
      config = "require('plugins.telescope')",
      requires = {
        { 'nvim-lua/popup.nvim' },
        { 'nvim-lua/plenary.nvim' },
        { 'nvim-telescope/telescope-fzf-native.nvim' }
      }
    }
    use { 'cljoly/telescope-repo.nvim' }
    use { 'kevinhwang91/nvim-bqf', ft = 'qf' }
    use { 'nvim-pack/nvim-spectre' }
    use { 'kyazdani42/nvim-tree.lua', config = "require('plugins.tree')" }

        -- General
    use { 'AndrewRadev/switch.vim' }
    use { 'AndrewRadev/splitjoin.vim' }
    use { 'numToStr/Comment.nvim', config = "require('plugins.comment')" }
end)
