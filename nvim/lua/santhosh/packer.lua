-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

    use {
	  'nvim-lualine/lualine.nvim',
	   requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
  use({
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end
  })
  -- use { "ellisonleao/gruvbox.nvim" }
  --
  --#region
  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
})
  use(
	  'nvim-treesitter/nvim-treesitter',
	  {run = ':TSUpdate'}
	  )
  use 'nvim-treesitter/nvim-treesitter-context'
  use('nvim-treesitter/playground')
  use 'mattn/emmet-vim'

  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use('christoomey/vim-tmux-navigator')

  use({
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
        require("null-ls").setup()
    end,
    requires = { "nvim-lua/plenary.nvim" },
})

  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}


  use {
	 'VonHeikemen/lsp-zero.nvim',
	 branch = 'v1.x',
	 requires = {
		 -- LSP Support
		 {'neovim/nvim-lspconfig'},             -- Required
		 {'williamboman/mason.nvim'},           -- Optional
		 {'williamboman/mason-lspconfig.nvim'}, -- Optional


		 -- Autocompletion
		{'hrsh7th/nvim-cmp'},         -- Required
		{'hrsh7th/cmp-nvim-lsp'},     -- Required
		{'hrsh7th/cmp-buffer'},       -- Optional
		{'hrsh7th/cmp-path'},         -- Optional
		{'saadparwaiz1/cmp_luasnip'}, -- Optional
		{'hrsh7th/cmp-nvim-lua'},     -- Optional

		-- Snippets
		{'L3MON4D3/LuaSnip'},             -- Required
	        {'rafamadriz/friendly-snippets'}, -- Optional
	      }
    }

  use {"ellisonleao/glow.nvim", config = function() require("glow").setup() end}

  use {"akinsho/toggleterm.nvim", tag = '*' }


  use {
      "olexsmir/gopher.nvim",
      requires = { -- dependencies
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
      },
    }

end)


