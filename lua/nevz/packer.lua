-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use({ 
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end
  })

  use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})

  use{
    'ThePrimeagen/harpoon', branch = 'harpoon2',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-vsnip",
    "hrsh7th/vim-vsnip",
  }
  use('windwp/nvim-ts-autotag')
  use {
	"windwp/nvim-autopairs",
   config = function() require("nvim-autopairs").setup {} end
  }
  use('sbdchd/neoformat')

  use {'srcery-colors/srcery-vim', as = 'srcery'}
end)
